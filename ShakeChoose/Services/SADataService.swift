//
//  SADataService.swift
//  ShakeChoose
//
//  Created by Zzy on 10/20/15.
//  Copyright © 2015 zangzhiya. All rights reserved.
//

import Foundation
import RealmSwift

private let sharedInstance = SADataService()

public class SADataService {
    
    let realm = try! Realm()
    
    class var sharedSingleton: SADataService {
        return sharedInstance
    }
    
    public func insertFood(food: SAFood) {
        self.addObject(food)
    }
    
    public func insertFood(name: String) {
        let food = SAFood(name: name)
        self.addObject(food)
    }
    
    public func insertFoodRecord(foodRecrod: SAFoodRecord) {
        self.addObject(foodRecrod)
    }
    
    public func insertFoodRecord(food: SAFood) {
        let foodRecord = SAFoodRecord(food: food)
        self.addObject(foodRecord)
    }
    
    public func foodByName(name: String) -> SAFood? {
        let predicate = NSPredicate(format: "name = %@", name)
        return self.realm.objects(SAFood).filter(predicate).first
    }
    
    public func foods() -> Array<SAFood> {
        return Array(self.realm.objects(SAFood).sorted("createdAt", ascending: false))
    }
    
    public func foodRecords() -> Array<SAFoodRecord> {
        return Array(self.realm.objects(SAFoodRecord).sorted("createdAt", ascending: false))
    }
    
    public func deleteFood(food: SAFood) {
        self.deleteObject(food)
    }
    
    public func deleteFoodRecord(foodRecord: SAFoodRecord) {
        self.deleteObject(foodRecord)
    }
    
    private func addObject(object: Object) {
        try! self.realm.write({ () -> Void in
            self.realm.add(object)
        })
    }
    
    private func deleteObject(object: Object) {
        try! self.realm.write({ () -> Void in
            self.realm.delete(object)
        })
    }
    
}
