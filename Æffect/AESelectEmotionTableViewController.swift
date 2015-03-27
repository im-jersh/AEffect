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
        ["headline" : "Elon Musk Says Self-Driving Tesla Cars Will Be in the U.S. by Summer", "featuredImage" : "tesla.png"],
        ["headline" : "Hackers Attack GreatFire.org, a Workaround for Websites Censored in China", "featuredImage" : "hackers.png"],
        ["headline" : "$10 Million Settlement in Target Data Breach Gets Preliminary Approval", "featuredImage" : "target.png"],
        ["headline" : "A Sucker Is Optimized Every Minute", "featuredImage" : "sucker.png"],
        ["headline" : "Suddenly, Plenty of Options for Cord Cutters", "featuredImage" : "cord-cutters.png"],
        ["headline" : "Facebook Announces a Payments Feature for Its Messenger App", "featuredImage" : "facebook.png"],
        ["headline" : "Capturing the Night in Digital Photos, Spectacularly", "featuredImage" : "night.png"],
        ["headline" : "Managers Turn to Computer Games, Aiming for More Efficient Employees", "featuredImage" : "manager.png"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // make cell separator lines clear
        self.tableView.separatorColor = UIColor.clearColor()
        
        // change tableView background view
        self.tableView.backgroundColor = UIColor.darkGrayColor()
        
        
        // add bottom bubble menu
        var bubbleMenu = self.createHomeButtonView()
        
        var upBubbleMenu : DWBubbleMenuButton = DWBubbleMenuButton(frame: CGRectMake(self.view.frame.size.width - bubbleMenu.frame.size.width - 20.0, self.view.frame.size.height - bubbleMenu.frame.size.height - 20.0, bubbleMenu.frame.size.width, bubbleMenu.frame.size.height), expansionDirection: .DirectionUp)
        
        upBubbleMenu.homeButtonView = bubbleMenu
        upBubbleMenu.addButtons(self.createButtons())
        
        self.navigationController?.view.addSubview(upBubbleMenu)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: DWBubbleMenuButton helper methods
    
    // Create main menu button
    func createHomeButtonView() -> UILabel {
        
        var label : UILabel = UILabel(frame: CGRectMake(0.0, 0.0, 60.0, 60.0))
        label.text = "Tap"
        label.textColor = UIColor.whiteColor()
        label.textAlignment = NSTextAlignment.Center
        label.layer.cornerRadius = label.frame.size.height / 2.0
        label.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.75)
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
            button.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.75)
            button.clipsToBounds = true
            button.tag = tag++
            
            button.addTarget(self, action: "buttonSelected:", forControlEvents: UIControlEvents.TouchUpInside)
            
            buttons.append(button)
        }
        
        return buttons
    }
    
    // Target method for select submenu button
    func buttonSelected(sender: UIButton) {
        println("Button tapped, tag: \(sender.tag)")
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
        return 8
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("article", forIndexPath: indexPath) as! AETableViewCell
        
        let cellData = testData[indexPath.row]
        
        
        // Configure the cell...
        let img = UIImage(named: cellData["featuredImage"]!)
        cell.clipsToBounds = true;
        cell.featuredImage.image = img
        cell.headline.text = cellData["headline"]!
        
        return cell
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the specified item to be editable.
    return true
    }
    */
    
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
