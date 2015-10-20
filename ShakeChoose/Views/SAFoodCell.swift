//
//  SAFoodCell.swift
//  ShakeChoose
//
//  Created by Zzy on 10/20/15.
//  Copyright © 2015 zangzhiya. All rights reserved.
//

import UIKit

class SAFoodCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    
    override func prepareForReuse() {
        self.nameLabel.text = ""
        self.createdAtLabel.text = ""
    }
    
    func configWithFood(food: SAFood) {
        self.nameLabel.text = food.name
        self.createdAtLabel.text = food.createdAt.dateStringWithFormat("yyyy-MM-dd")
    }
    
}
