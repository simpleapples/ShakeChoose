//
//  SAMainController.swift
//  ShakeChoose
//
//  Created by Zzy on 10/20/15.
//  Copyright © 2015 zangzhiya. All rights reserved.
//

import UIKit

class SAMainController: UIViewController {
    
    override func viewDidLoad() {
        
    }
    
    @IBAction func addButtonTouchUp(sender: AnyObject) {
        let alertController = UIAlertController(title: "添加餐食", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "输入要添加的餐食名称"
            textField.becomeFirstResponder()
        }
        let addAction = UIAlertAction(title: "添加", style: UIAlertActionStyle.Default) { (action) -> Void in
            if alertController.textFields?.first != nil {
                if let name = alertController.textFields?.first?.text {
                    if name.characters.count > 0 {
                        SADataService.sharedSingleton.insertFood(name)
                    }
                }
            }
        }
        let cancelAction = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
        
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}
