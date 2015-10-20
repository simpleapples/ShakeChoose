//
//  SAFoodListViewController.swift
//  ShakeChoose
//
//  Created by Zzy on 10/20/15.
//  Copyright © 2015 zangzhiya. All rights reserved.
//

import UIKit

class SAFoodListViewController: UITableViewController {
    
    var foodList: Array = [SAFood]()
    
    override func viewDidLoad() {
        self.foodList = SADataService.sharedSingleton.foods()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.foodList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let food = self.foodList[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("SAFoodCell", forIndexPath: indexPath) as! SAFoodCell
        cell.configWithFood(food)
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            let food = self.foodList[indexPath.row]
            self.foodList.removeAtIndex(indexPath.row)
            SADataService.sharedSingleton.deleteFood(food)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
    }

}
