//
//  SAFood.swift
//  ShakeChoose
//
//  Created by Zzy on 10/20/15.
//  Copyright © 2015 zangzhiya. All rights reserved.
//

import RealmSwift

public final class SAFood: Object {
    
    dynamic var name = ""
    dynamic var createdAt = NSDate(timeIntervalSinceNow: 1)
    
    public convenience init(name foodName: String) {
        self.init()
        self.name = foodName
    }
    
}