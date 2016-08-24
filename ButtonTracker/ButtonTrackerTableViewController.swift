//
//  ButtonTrackerTableViewController.swift
//  ButtonTracker
//
//  Created by Gavi Rawson on 8/23/16.
//  Copyright © 2016 Corrie Health. All rights reserved.
//

import UIKit

class ButtonTrackerTableViewController: UITableViewController {

    var buttonProgressArray = [ButtonProgress]()
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSampleButtonGroups();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadSampleButtonGroups() {
        let group1 = ButtonProgress(numButtons: 3, name: "Group 1")
        let group2 = ButtonProgress(numButtons: 4, name: "Group 2")
        let group3 = ButtonProgress(numButtons: 5, name: "Group 3")
        buttonProgressArray = [group1, group2, group3]
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buttonProgressArray.count + 1
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("HeaderCell", forIndexPath: indexPath) as! HeaderCell
            var count = 0
            for var i = 0; i < buttonProgressArray.count; i++ {
                count += buttonProgressArray[i].numSelected
            }
            
            cell.numSelectedButtonsLabel.text = "\(count)"
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("GroupCell", forIndexPath: indexPath) as! GroupCell
            
            let group = buttonProgressArray[indexPath.row - 1]
            
            cell.numButtonsSelectedLabel.text = "\(group.numSelected)/\(group.buttonsArray.count)"
            cell.groupNameLabel.text = "\(group.name)"
            return cell
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row != 0 {
            selectedIndex = indexPath.row - 1
            self.performSegueWithIdentifier("ButtonGroupDetailSegue", sender: self)
        }
    }

    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ButtonGroupDetailSegue" {
            if let buttonViewController = segue.destinationViewController as? ButtonGroupViewController {
                buttonViewController.buttonProgress = buttonProgressArray[selectedIndex]
            }
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }

}
