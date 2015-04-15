//
//  AESelectEmotionTableViewController.swift
//  Æffect
//
//  Created by Joshua O'Steen on 3/20/15.
//  Copyright (c) 2015 Josh O'Steen. All rights reserved.
//

import UIKit

class AESelectEmotionTableViewController: UITableViewController {
    
    
    let testData = [
        ["headline" : "Elon Musk Says Self-Driving Tesla Cars Will Be in the U.S. by Summer","date":"2015-04-33","author":"ABC DEF", "featuredImage" : "tesla.png", "story" : "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."],
        ["headline" : "Hackers Attack GreatFire.org, a Workaround for Websites Censored in China","date":"2015-04-33","author":"ABC DEF", "featuredImage" : "hackers.png" , "story" : "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."],
        ["headline" : "$10 Million Settlement in Target Data Breach Gets Preliminary Approval","date":"2015-04-33","author":"ABC DEF",  "featuredImage" : "target.png" , "story" : "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."],
        ["headline" : "A Sucker Is Optimized Every Minute","date":"2015-04-33","author":"ABC DEF",  "featuredImage" : "sucker.png", "story" : ""],
        ["headline" : "Suddenly, Plenty of Options for Cord Cutters","date":"2015-04-33","author":"ABC DEF",  "featuredImage" : "cord-cutters.png", "story" : ""],
        ["headline" : "Facebook Announces a Payments Feature for Its Messenger App","date":"2015-04-33","author":"ABC DEF",  "featuredImage" : "facebook.png", "story" : ""],
        ["headline" : "Capturing the Night in Digital Photos, Spectacularly","date":"2015-04-33","author":"ABC DEF",  "featuredImage" : "night.png", "story" : ""],
        ["headline" : "Managers Turn to Computer Games, Aiming for More Efficient Employees","date":"2015-04-33","author":"ABC DEF",  "featuredImage" : "manager.png", "story" : ""]
    ]

    
    var upBubbleMenu : DWBubbleMenuButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // make cell separator lines clear
        self.tableView.separatorColor = UIColor.grayColor()
        // change tableView background view
        self.tableView.backgroundColor = UIColor.whiteColor()
        
        
        // add bottom bubble menu
        var bubbleMenu = self.createHomeButtonView(99)
        
        upBubbleMenu = DWBubbleMenuButton(frame: CGRectMake(self.view.frame.size.width - bubbleMenu.frame.size.width - 20.0, self.view.frame.size.height - bubbleMenu.frame.size.height - 20.0, bubbleMenu.frame.size.width, bubbleMenu.frame.size.height), expansionDirection: .DirectionUp)
        

        upBubbleMenu!.homeButtonView = bubbleMenu
        upBubbleMenu!.addButtons(self.createButtons())
        upBubbleMenu!.tag = 37
        
        self.navigationController?.view.addSubview(upBubbleMenu!)
        
        println("I'm here!");
        
        let backButton = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
        
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.view.addSubview(upBubbleMenu!)
    }
    
    
    // Target method for select submenu button
    func buttonSelected(sender: UIButton) {
        println("Button tapped, tag: \(sender.tag)")
    }
    
    
    // Create main menu button
    func createHomeButtonView(inputemotion: Int) -> UILabel {
        
        var label : UILabel = UILabel(frame: CGRectMake(0.0, 0.0, 60.0, 60.0))
        if (inputemotion == 99) {
            label.text = "Æ"
        }
        
        label.textColor = UIColor.whiteColor()
        label.textAlignment = NSTextAlignment.Center
        label.layer.cornerRadius = label.frame.size.height / 2.0
        label.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.6)
        label.clipsToBounds = true
        
        return label
    }
    
    // Create main menu button
    func createHomeButtonViewFromText(text: String) -> UILabel {
        
        var label : UILabel = UILabel(frame: CGRectMake(0.0, 0.0, 60.0, 60.0))
        label.text = text
        label.textColor = UIColor.whiteColor()
        label.textAlignment = NSTextAlignment.Center
        label.layer.cornerRadius = label.frame.size.height / 2.0
        label.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.6)
        label.clipsToBounds = true
        
        return label
    }
    
    // Create submenu buttons
    func createButtons() -> Array<UIButton> {
        
        var buttons : Array<UIButton> = Array()
        var tag = 0
        
        for buttonTitle in ["😄", "😳", "😢", "😒", "😠", "😖"] {
            var button : UIButton = UIButton()
            button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            button.setTitle(buttonTitle, forState: UIControlState.Normal)
            
            button.frame = CGRectMake(0.0, 0.0, 40.0, 40.0)
            button.layer.cornerRadius = button.frame.size.height / 2.0
            
            var bgColor : UIColor
            if (buttonTitle == "😄") {
                // yellow
                // bgColor = [UIColor colorWithRed:0.925f green:0.776f blue:0.184f alpha:0.5f];
                bgColor = UIColor(red: 0.925, green: 0.776, blue: 0.184, alpha: 0.8)
            } else if (buttonTitle == "😳") {
                // green
                // bgColor = [UIColor colorWithRed:0.467f green:0.749f blue:0.173f alpha:0.5f];
                bgColor = UIColor(red: 0.467, green: 0.749, blue: 0.173, alpha: 0.8)
            } else if (buttonTitle == "😢") {
                // blue
                // bgColor = [UIColor colorWithRed:0.039f green:0.510f blue:0.663f alpha:0.5f];
                bgColor = UIColor(red: 0.039, green: 0.510, blue: 0.663, alpha: 0.8)
            } else if (buttonTitle == "😒") {
                // purple
                // bgColor = [UIColor colorWithRed:0.494f green:0.298f blue:0.631f alpha:0.5f];
                bgColor = UIColor(red: 0.494, green: 0.298, blue: 0.631, alpha: 0.8)
            } else if (buttonTitle == "😠") {
                // orange
                // bgColor = [UIColor colorWithRed:0.914f green:0.439f blue:0.118f alpha:0.5f];
                bgColor = UIColor(red: 0.914, green: 0.439, blue: 0.118, alpha: 0.8)
            } else if (buttonTitle == "😖") {
                // red
                // bgColor = [UIColor colorWithRed:0.871f green:0.000f blue:0.286f alpha:0.5f];
                bgColor = UIColor(red: 0.871, green: 0.000, blue: 0.286, alpha: 0.8)
            } else {
                // bgColor = [UIColor colorWithWhite:0.0 alpha:0.5];
                bgColor = UIColor.blackColor()
            }
            
            //button.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.75)
            button.backgroundColor = bgColor
            
            button.clipsToBounds = true
            button.tag = tag++
            
            button.addTarget(self, action: "emotionSelected:", forControlEvents: UIControlEvents.TouchUpInside)
            
            buttons.append(button)
        }
        
        return buttons
    }
    
    // Target method for select submenu button
    func emotionSelected(sender: UIButton) {
        
        // DEBUG
        println("Button tapped, tag: \(sender.tag)")
        
        // change menu label text to match selection
        for subview in self.navigationController!.view.subviews as! [UIView] {
            if var mainButton = subview as? DWBubbleMenuButton {
                mainButton.homeButtonView = self.createHomeButtonViewFromText(sender.titleLabel!.text!)
                self.navigationController?.view.addSubview(mainButton)
            }
        }
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
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
    
    var newsHeadLine = ""
    var newsImage = UIImage?()
    /*
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
    let cellData = testData[indexPath.row]
    
    newsHeadLine = cellData["headline"]!
    newsImage = UIImage(named: cellData["featuredImage"]!)
    }
    */
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        upBubbleMenu!.removeFromSuperview()

        if segue.identifier == "showNewsStory" {
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
    
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the specified item to be editable.
        return true
    }

    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
            
        }
        else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

//table view swipe from the right to left
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]?  {
        // 1
        var shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Share " , handler: { (action, indexPath:NSIndexPath!) -> Void in
            // 2
            let shareMenu = UIAlertController(title: nil, message: "Remove From current List", preferredStyle: .ActionSheet)
            
            let twitterAction = UIAlertAction(title: "Confirm", style: UIAlertActionStyle.Default, handler: nil)
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
            
            shareMenu.addAction(twitterAction)
            shareMenu.addAction(cancelAction)
            
            
            self.presentViewController(shareMenu, animated: true, completion: nil)
        })
        
        shareAction.backgroundColor = UIColor.grayColor()
    
        // 3
        var addAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Add    \u{000A}List" , handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            // 4
            let addMenu = UIAlertController(title: nil, message: "Add to reading list", preferredStyle: .ActionSheet)
            
            let appRateAction = UIAlertAction(title: "Confirm", style: UIAlertActionStyle.Default, handler: nil)
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
            
            addMenu.addAction(appRateAction)
            addMenu.addAction(cancelAction)
            
            
            self.presentViewController(addMenu, animated: true, completion: nil)
        })
        // 5
        addAction.backgroundColor = UIColor.lightGrayColor()
        
        var markAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Mark  " , handler: { (action, indexPath:NSIndexPath!) -> Void in
            
           //tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
            
        })
        
        markAction.backgroundColor = UIColor.darkGrayColor()
        
        return [shareAction,addAction, markAction]
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