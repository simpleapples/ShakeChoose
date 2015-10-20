//
//  SAFoodRecord.swift
//  ShakeChoose
//
//  Created by Zzy on 10/20/15.
//  Copyright © 2015 zangzhiya. All rights reserved.
//

import RealmSwift

public final class SAFoodRecord: Object {
    
    dynamic var food: SAFood!
    dynamic var createdAt = NSDate(timeIntervalSinceNow: 1)
        
    public convenience init(food foodObject: SAFood) {
        self.init()
        food = foodObject
    }
    
}
