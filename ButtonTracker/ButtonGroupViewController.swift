//
//  ButtonGroupViewController.swift
//  ButtonTracker
//
//  Created by Gavi Rawson on 8/23/16.
//  Copyright © 2016 Corrie Health. All rights reserved.
//

import UIKit

class ButtonGroupViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    var buttonProgress = ButtonProgress?()
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Collection view data source
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (buttonProgress?.buttonsArray.count)!
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ButtonCollectionViewCell", forIndexPath: indexPath) as! ButtonCollectionViewCell
        var buttonTitle: String
        if let tempButton = buttonProgress?.buttonsArray[indexPath.row] {
            buttonTitle = tempButton.titleLabel!.text!
            cell.button.selected = tempButton.selected
            cell.button.backgroundColor = tempButton.backgroundColor
        } else {
            buttonTitle = "Group"
            cell.button.selected = false
        }
        
        cell.button.tintColor = UIColor.clearColor()
        cell.button.addTarget(self, action: "setSelected:", forControlEvents: .TouchUpInside)
        cell.button.setTitle(buttonTitle, forState: UIControlState.Normal)
        
        return cell
    }
    
    func setSelected(sender: UIButton!) {
        let point = sender.convertPoint(CGPointZero, toView: collectionView)
        let index = collectionView!.indexPathForItemAtPoint(point)?.row
        buttonProgress?.buttonsArray[index!].selected = sender.selected
        buttonProgress?.buttonsArray[index!].backgroundColor = sender.backgroundColor
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
