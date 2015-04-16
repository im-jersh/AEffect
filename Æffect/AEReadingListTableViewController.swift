//
//  AEReadingListTableViewController.swift
//  Æffect
//
//  Created by Joshua O'Steen on 4/15/15.
//  Copyright (c) 2015 Josh O'Steen. All rights reserved.
//

import UIKit

class AEReadingListTableViewController: UITableViewController {

    // STRONG outlet to done button
    // strong reference in order to allow for appear/disappear when entering/exiting edit mode
    @IBOutlet var doneButton: UIBarButtonItem!
    
    var testData = [
        ["headline" : "Elon Musk Says Self-Driving Tesla Cars Will Be in the U.S. by Summer","date":"2015-04-33","author":"ABC DEF", "featuredImage" : "tesla.png", "story" : "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."],
        ["headline" : "Hackers Attack GreatFire.org, a Workaround for Websites Censored in China","date":"2015-04-33","author":"ABC DEF", "featuredImage" : "hackers.png" , "story" : "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."],
        ["headline" : "$10 Million Settlement in Target Data Breach Gets Preliminary Approval","date":"2015-04-33","author":"ABC DEF",  "featuredImage" : "target.png" , "story" : "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."],
        ["headline" : "A Sucker Is Optimized Every Minute","date":"2015-04-33","author":"ABC DEF",  "featuredImage" : "sucker.png", "story" : ""],
        ["headline" : "Suddenly, Plenty of Options for Cord Cutters","date":"2015-04-33","author":"ABC DEF",  "featuredImage" : "cord-cutters.png", "story" : ""],
        ["headline" : "Facebook Announces a Payments Feature for Its Messenger App","date":"2015-04-33","author":"ABC DEF",  "featuredImage" : "facebook.png", "story" : ""],
        ["headline" : "Capturing the Night in Digital Photos, Spectacularly","date":"2015-04-33","author":"ABC DEF",  "featuredImage" : "night.png", "story" : ""],
        ["headline" : "Managers Turn to Computer Games, Aiming for More Efficient Employees","date":"2015-04-33","author":"ABC DEF",  "featuredImage" : "manager.png", "story" : ""]
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // make cell separator lines gray
        self.tableView.separatorColor = UIColor.grayColor()
        // change tableView background view
        self.tableView.backgroundColor = UIColor.whiteColor()
        
        // add system edit button to navigation bar
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        
        
        let backButton = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
        
    }
    
    override func viewWillAppear(animated: Bool) {
    
        
        
    }
    
    
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 6
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return testData.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("article", forIndexPath: indexPath) as! AETableViewCell
        
        let cellData = testData[indexPath.row]
        
        
        // Configure the cell...
        let img = UIImage(named: cellData["featuredImage"]!)
        cell.clipsToBounds = true;
        cell.featuredImage.image = img
        cell.headline.text = cellData["headline"]!
        
        let author = cellData["author"]!.uppercaseString
        cell.author.text = "By \(author)"
        cell.pubDate.text = cellData["date"]!
        
        if (cellData["emotion"] == "joy") {
            cell.emotionColor.backgroundColor = UIColor(red: 0.925, green: 0.776, blue: 0.184, alpha: 0.8)
        } else if (cellData["emotion"] == "surprised") {
            cell.emotionColor.backgroundColor = UIColor(red: 0.467, green: 0.749, blue: 0.173, alpha: 0.8)
        } else if (cellData["emotion"] == "sadness") {
            cell.emotionColor.backgroundColor = UIColor(red: 0.039, green: 0.510, blue: 0.663, alpha: 0.8)
        } else if (cellData["emotion"] == "annoyed") {
            cell.emotionColor.backgroundColor = UIColor(red: 0.494, green: 0.298, blue: 0.631, alpha: 0.8)
        } else if (cellData["emotion"] == "anger") {
            cell.emotionColor.backgroundColor = UIColor(red: 0.914, green: 0.439, blue: 0.118, alpha: 0.8)
        } else if (cellData["emotion"] == "fear") {
            cell.emotionColor.backgroundColor = UIColor(red: 0.871, green: 0.000, blue: 0.286, alpha: 0.8)
        } else {
            cell.emotionColor.backgroundColor = UIColor.blackColor()
        }
        
        return cell
    }
    
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        
        if tableView.editing {
            // don't push to article detail 
            
        } else if !tableView.editing {
            // perform segue
            self.performSegueWithIdentifier("showArticleDetail", sender: self)
            
        }
    
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showArticleDetail" {
            if let destination = segue.destinationViewController as? AESingleStoryViewController {
                if let newsIndex = tableView.indexPathForSelectedRow()?.row {
                    
                    //println(newsIndex)
                    //destination.headLine = testData[newsIndex].headline
                    var newsH = testData[newsIndex];
                    
                    destination.newsTitle = newsH["headline"]!
                    destination.newsImage = newsH["featuredImage"]!
                    destination.newsStory = newsH["story"]!
                    destination.newsDate = newsH["date"]!
                    destination.newsAuthor = newsH["author"]!
                }
            }
        }
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        
        // call super to change button item title
        super.setEditing(editing, animated: animated)
        
        // enter edit mode
        if editing {
            // set table to edit mode
            self.tableView.setEditing(editing, animated: animated)
            // remove left done button from nav bar
            self.navigationItem.setLeftBarButtonItem(nil, animated: true)
            
        } else if !editing { // exit edit mode
            // exit edit mode in table view
            self.tableView.setEditing(editing, animated: animated)
            // add left done button to nav bar
            self.navigationItem.setLeftBarButtonItem(self.doneButton, animated: true)
        }
        
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // all cells in the table view should be editable
        return true
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    
        if editingStyle == .Delete {
            // Delete the row from the data source
            testData.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    // swipe options method
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]?  {
        
        // Remove selected article cell from table view
        var shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Remove" , handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            // 2
            let shareMenu = UIAlertController(title: nil, message: "Remove From current List", preferredStyle: .ActionSheet)
            
            let twitterAction = UIAlertAction(title: "Confirm", style: UIAlertActionStyle.Default, handler: {(alert: UIAlertAction!) -> Void in
                // remove article from data source
                self.testData.removeAtIndex(indexPath.row)
                // remove row from table
                self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            })
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
            
            shareMenu.addAction(twitterAction)
            shareMenu.addAction(cancelAction)
            
            
            self.presentViewController(shareMenu, animated: true, completion: nil)
        })
        
        shareAction.backgroundColor = UIColor.redColor()
        
        
        // 3
        var rateAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Add to List" , handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            // 4
            let rateMenu = UIAlertController(title: nil, message: "Add to your reading list", preferredStyle: .ActionSheet)
            
            let appRateAction = UIAlertAction(title: "Confirm", style: UIAlertActionStyle.Default, handler: nil)
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
            
            rateMenu.addAction(appRateAction)
            rateMenu.addAction(cancelAction)
            
            
            self.presentViewController(rateMenu, animated: true, completion: nil)
        })
        // 5
        rateAction.backgroundColor = UIColor.blueColor()
        return [shareAction,rateAction]
    }
    
    
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
}
