//
//  NSDate+Utils.swift
//  ShakeChoose
//
//  Created by Zzy on 10/20/15.
//  Copyright © 2015 zangzhiya. All rights reserved.
//

import Foundation

extension NSDate {
    
    func dateStringWithFormat(format: String) -> String {
        let dateFormatter = NSDateFormatter.init()
        dateFormatter.dateFormat = format
        return dateFormatter.stringFromDate(self)
    }
    
}
