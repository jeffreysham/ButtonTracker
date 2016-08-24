//
//  ButtonCollectionViewCell.swift
//  ButtonTracker
//
//  Created by Home on 8/24/16.
//  Copyright © 2016 Corrie Health. All rights reserved.
//

import UIKit

class ButtonCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var button: UIButton!
    
    @IBAction func changeButtonColor(sender: AnyObject) {
        if button.backgroundColor == UIColor.blueColor() {
            button.backgroundColor = UIColor.grayColor()
            button.selected = true
        } else {
            button.backgroundColor = UIColor.blueColor()
            button.selected = false
        }
    }
}