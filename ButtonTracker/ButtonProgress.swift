//
//  ButtonProgress.swift
//  ButtonTracker
//
//  Created by Gavi Rawson on 8/23/16.
//  Copyright © 2016 Corrie Health. All rights reserved.
//

import UIKit

class ButtonProgress {
    var buttonsArray: [UIButton] = []
    var name: String
    
    init(numButtons: Int, name: String) {
        self.name = name
        
        for var i = 0; i < numButtons; i++ {
            let tempButton = UIButton()
            tempButton.setTitle("Button \(i+1)", forState: .Normal)
            tempButton.backgroundColor = UIColor.blueColor()
            self.buttonsArray.append(tempButton)
        }
    }
    
    var numSelected: Int {
        var count = 0
        for var i = 0; i < buttonsArray.count; i++ {
            let tempButton = buttonsArray[i]
            if tempButton.selected {
                count++
            }
        }
        return count
    }
}
