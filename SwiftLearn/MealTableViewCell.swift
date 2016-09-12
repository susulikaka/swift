//
//  MealTableViewCell.swift
//  SwiftLearn
//
//  Created by SupingLi on 16/9/10.
//  Copyright © 2016年 SupingLi. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var desText: UITextView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
