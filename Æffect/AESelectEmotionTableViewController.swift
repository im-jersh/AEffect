//
//  AESelectEmotionTableViewController.swift
//  Æffect
//
//  Created by Joshua O'Steen on 3/20/15.
//  Copyright (c) 2015 Josh O'Steen. All rights reserved.
//

import UIKit

class AESelectEmotionTableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate, UIPopoverPresentationControllerDelegate {
    
    struct AEData {
        var emoji: String
        var bgColor: UIColor
    }
    let emojiArray = ["😄", "😳", "😢", "😒", "😖", "😠"]
    let emotionArray = ["happy", "surprise", "sadness", "worried", "fear", "anger"]
    
    let aedictionary: [String: AEData] = [
        
        "happy": AEData(emoji: "😄", bgColor: UIColor(red: 0.925, green: 0.776, blue: 0.184, alpha: 0.8)),
        "surprise": AEData(emoji: "😳", bgColor: UIColor(red: 0.467, green: 0.749, blue: 0.173, alpha: 0.8)),
        "sadness": AEData(emoji: "😢", bgColor: UIColor(red: 0.039, green: 0.510, blue: 0.663, alpha: 0.8)),
        "worried": AEData(emoji: "😒", bgColor: UIColor(red: 0.494, green: 0.298, blue: 0.631, alpha: 0.8)),
        "fear": AEData(emoji: "😖", bgColor: UIColor(red: 0.871, green: 0.000, blue: 0.286, alpha: 0.8)),
        "anger": AEData(emoji: "😠", bgColor: UIColor(red: 0.914, green: 0.439, blue: 0.118, alpha: 0.8)),
    ]
    
    
    //var defaultEmotion: String = self.emotionArray[0]
    
    var currentEmotionColor : UIColor = UIColor(red: 0.925, green: 0.776, blue: 0.184, alpha: 0.8)
    
    var upBubbleMenu : DWBubbleMenuButton?
    
    var pull_action : CBStoreHouseRefreshControl?
    var page = 0
    ////////////////////////////////////////////////////////////////////////////////////////
    /*Get news data from server*/
    var urlString = "https://peaceful-cove-8511.herokuapp.com/db/?emotion=joy&offset=10"

    var urlStringHappy = "https://peaceful-cove-8511.herokuapp.com/db/?emotion=joy&offset=10"
    var urlStringFear = "https://peaceful-cove-8511.herokuapp.com/db/?emotion=fear&offset=10"
    var urlStringSadness = "https://peaceful-cove-8511.herokuapp.com/db/?emotion=sadness&offset=10"
    var urlStringSuprise = "https://peaceful-cove-8511.herokuapp.com/db/?emotion=surprise&offset=10"
    var urlStringWorried = "https://peaceful-cove-8511.herokuapp.com/db/?emotion=worried&offset=10"
    var urlStringAnger = "https://peaceful-cove-8511.herokuapp.com/db/?emotion=anger&offset=10"

    var stories: AEStories = AEStories()
    var storieshappy: AEStories = AEStories()
    var storiesfear: AEStories = AEStories()
    var storiessadness: AEStories = AEStories()
    var storiessuprise: AEStories = AEStories()
    var storiesworried: AEStories = AEStories()
    var storiesanger: AEStories = AEStories()

    

    var selectedStory: AEStory?
    
    ////////////////////////////////////////////////////////////////////////////////////////
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        storiesfear.load(urlStringFear) {
            (news, errorString) -> Void in
            if let unwrappedErrorString = errorString {
                println(unwrappedErrorString)
            }
        }
        
        storiesworried.load(urlStringWorried) {
            (news, errorString) -> Void in
            if let unwrappedErrorString = errorString {
                println(unwrappedErrorString)
            }
        }
        
        storiesanger.load(urlStringAnger) {
            (news, errorString) -> Void in
            if let unwrappedErrorString = errorString {
                println(unwrappedErrorString)
            }
        }
        
        storiessadness.load(urlStringSadness) {
            (news, errorString) -> Void in
            if let unwrappedErrorString = errorString {
                println(unwrappedErrorString)
            }
        }
        
        storiessuprise.load(urlStringSuprise) {
            (news, errorString) -> Void in
            if let unwrappedErrorString = errorString {
                println(unwrappedErrorString)
            }
        }
        
        storieshappy.load(urlStringHappy) {
            (news, errorString) -> Void in
            if let unwrappedErrorString = errorString {
                println(unwrappedErrorString)
            } else {
                self.stories = self.storieshappy
                self.tableView.reloadData()
            }
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // make cell separator lines gray
        self.tableView.separatorColor = UIColor.grayColor()
        // change tableView background view
        self.tableView.backgroundColor = UIColor.whiteColor()
        
        
        //creat pull to refresh
        pull_action = CBStoreHouseRefreshControl.attachToScrollView(tableView, target: self, refreshAction: "refreshTriggered:", plist: "AEPull", color: UIColor.blackColor(), lineWidth: 1, dropHeight: 80, scale: 1, horizontalRandomness: 150, reverseLoadingAnimation: false, internalAnimationFactor: 0.5);
        //
        
        // add bottom bubble menu
        var bubbleMenu = self.createHomeButtonView(99)
        
        upBubbleMenu = DWBubbleMenuButton(frame: CGRectMake(self.view.frame.size.width - bubbleMenu.frame.size.width - 20.0, self.view.frame.size.height - bubbleMenu.frame.size.height - 20.0, bubbleMenu.frame.size.width, bubbleMenu.frame.size.height), expansionDirection: .DirectionUp)
        
        
        upBubbleMenu!.homeButtonView = bubbleMenu
        upBubbleMenu!.addButtons(self.createButtons())
        upBubbleMenu!.tag = 37
        
        
        let backButton = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
        
    }
    
    
    ///////////////////////////////
    //Hang CUI April/21/2015
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        self.pull_action?.scrollViewDidScroll()
    }
    
    override func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.pull_action?.scrollViewDidEndDragging()
    }
    
    func refreshTriggered(sender: AnyObject){
        page++
        var timer = NSTimer(timeInterval: 10.0, target: self, selector: Selector("finishRefreshControl:"), userInfo: nil , repeats: false)
        timer.fire()
        
    }
    
    func finishRefreshControl (timer: NSTimer)
    {
        let delay = 2 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue()) {
            self.pull_action?.finishingLoading()
        }
        if (currentEmotionColor == UIColor(red: 0.925, green: 0.776, blue: 0.184, alpha: 0.8)){
            urlString = "https://peaceful-cove-8511.herokuapp.com/db/?emotion=happy&offset="
            
        }
        else if (currentEmotionColor == UIColor(red: 0.467, green: 0.749, blue: 0.173, alpha: 0.8)){
            urlString = "https://peaceful-cove-8511.herokuapp.com/db/?emotion=surprise&offset="
            
        }
        else if (currentEmotionColor == UIColor(red: 0.039, green: 0.510, blue: 0.663, alpha: 0.8)){
            urlString = "https://peaceful-cove-8511.herokuapp.com/db/?emotion=sadness&offset="
            
        }
        else if (currentEmotionColor == UIColor(red: 0.494, green: 0.298, blue: 0.631, alpha: 0.8)){
            urlString = "https://peaceful-cove-8511.herokuapp.com/db/?emotion=worried&offset="
            
        }
        else if (currentEmotionColor == UIColor(red: 0.914, green: 0.439, blue: 0.118, alpha: 0.8)){
            urlString = "https://peaceful-cove-8511.herokuapp.com/db/?emotion=anger&offset="
            
        }
        else if (currentEmotionColor == UIColor(red: 0.871, green: 0.000, blue: 0.286, alpha: 0.8)){
            urlString = "https://peaceful-cove-8511.herokuapp.com/db/?emotion=fear&offset="
            
        }
        var offset = page * 10
        urlString = urlString + String(offset)
        stories.load(urlString) {
            (news, errorString) -> Void in
            if let unwrappedErrorString = errorString {
                println(unwrappedErrorString)
            } else {
                self.tableView.reloadData()
            }
        }
    }
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    ///////////////////////////////
    
    
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.view.addSubview(upBubbleMenu!)
    }
    
    @IBAction func unwindToMainFeed(segue: UIStoryboardSegue) {
        // println("back to main feed")
    }
    
    
    // Target method for select submenu button
    func buttonSelected(sender: UIButton) {
        println("Button tapped, tag: \(sender.tag)")
    }
    
    override func viewWillDisappear(animated: Bool) {
        upBubbleMenu!.removeFromSuperview()
    }
    
    
    // Create main menu button
    func createHomeButtonView(inputemotion: Int) -> UILabel {
        
        
        var label : UILabel = UILabel(frame: CGRectMake(0.0, 0.0, 60.0, 60.0))
        /*
        label.text = "Æ"
        label.textColor = UIColor.whiteColor()
        label.textAlignment = NSTextAlignment.Center
        label.layer.cornerRadius = label.frame.size.height / 2.0
        label.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.6)
        label.clipsToBounds = true
        */
        
        //Hang CUI April/20/2015
        //change default Æ buttom to 😄 buttom
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.925, green: 0.776, blue: 0.184, alpha: 0.8)
        self.title = emotionArray[0].capitalizedString
        label.text = "😄"
        label.textAlignment = NSTextAlignment.Center
        label.layer.cornerRadius = label.frame.size.height / 2.0
        label.backgroundColor = UIColor(red: 0.925, green: 0.776, blue: 0.184, alpha: 0.8)
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
        
        for emotion in self.emotionArray {
            
            var button : UIButton = UIButton()
            button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            button.setTitle(aedictionary[emotion]!.emoji, forState: UIControlState.Normal)
            
            button.frame = CGRectMake(0.0, 0.0, 40.0, 40.0)
            button.layer.cornerRadius = button.frame.size.height / 2.0
            
            button.backgroundColor = self.aedictionary[emotion]!.bgColor
            
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
        
        // adjusts tint color of navigation bar according to selected emotion
        self.navigationController?.navigationBar.barTintColor = sender.backgroundColor
        
        self.title = emotionArray[sender.tag].capitalizedString
        
        // temporary UILabel to adjust homeButtonView properties (1 & 2)
        var temp = self.upBubbleMenu!.homeButtonView as! UILabel
        
        // Set text to selected emoji
        temp.text = emojiArray[sender.tag]
        
        // Set color to corresponding emotion color
        temp.backgroundColor = sender.backgroundColor
        
        self.upBubbleMenu!.homeButtonView = temp
        
        self.currentEmotionColor = sender.backgroundColor!
        
        
        ///////////////////////////
        //Hang CUI - April/20/2015
        //this part is trying to change the info when a emotion button clicked
        
        var temp_emotion = emotionArray[sender.tag]
        
        //var changeString : NSSring = "stories\(temp_emotion)"
        
        urlString = "https://peaceful-cove-8511.herokuapp.com/db/?emotion=\(temp_emotion)&offset=0"
        //println(urlString)
       
        if sender.tag == 0 {
            self.stories = storieshappy
        }
        if sender.tag == 1 {
            self.stories = storiessuprise
        }
        if sender.tag == 2 {
            self.stories = storiessadness
        }
        if sender.tag == 3 {
            self.stories = storiesworried
        }
        if sender.tag == 4 {
            self.stories = storiesfear
        }
        if sender.tag == 5 {
            self.stories = storiesanger
        }
        
        
        self.tableView.reloadData()
        
        ///////////////////////////
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
        return stories.story.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("article", forIndexPath: indexPath) as! AETableViewCell
        
        let cellData = stories.story[indexPath.row]
        
        
        // Configure the cell...
        
        //this line is important if user Scroll the table view to fast, and the image will be replaced with other image, however, this line will set the image as a blank image if user Scroll to fast
        
        var picURL = ""
        var tempURL = ""
        println(cellData.picture_url)
        
        if  cellData.picture_url != "null" {
            var pictureURL = cellData.picture_url
            var length = count(pictureURL) - 14
            
            var tail_range = Range(start: advance(pictureURL.startIndex, length), end: pictureURL.endIndex)
            var tail_string = pictureURL.substringWithRange(tail_range)
            println (tail_string)
            
            if tail_string != "ticleLarge.jpg" {
                var range = Range(start: pictureURL.startIndex, end: advance(pictureURL.startIndex, length))
                tempURL = pictureURL.substringWithRange(range)
            }
            else {
                var range = Range(start: pictureURL.startIndex, end: advance(pictureURL.startIndex, length-2))
                tempURL = pictureURL.substringWithRange(range)
            }
            picURL = "\(tempURL)thumbWide.jpg"

        }
        else {
            picURL = cellData.picture_url
        }
        println(picURL)
        cell.featuredImage.sd_setImageWithURL(NSURL(string: picURL as String)!, placeholderImage: UIImage(named: "noimage.jpg"))
        
        
        /*cell.featuredImage.image = UIImage(named: "noimage.jpg")
        
        var imgURL: NSURL = NSURL(string: cellData.picture_url)!
        let request: NSURLRequest = NSURLRequest(URL: imgURL)
        NSURLConnection.sendAsynchronousRequest(
        request, queue: NSOperationQueue.mainQueue(),
        completionHandler: {(response: NSURLResponse!,data: NSData!,error: NSError!) -> Void in
        if error == nil {
        cell.featuredImage.image = UIImage(data: data)
        }
        })
        */
        
        // Get and parse date from response
        let hold: [String] = cellData.pubdate.componentsSeparatedByString("-")
        
        
        let dateComponents = NSDateComponents()
        
        dateComponents.year = hold[0].toInt()!
        dateComponents.month = hold[1].toInt()!
        dateComponents.day = hold[2].toInt()!
        
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "d MMMM y"
        
        var date = NSCalendar.currentCalendar().dateFromComponents(dateComponents)
        
        cell.clipsToBounds = true;
        cell.headline.text = cellData.title
        
        let author = cellData.author.uppercaseString
        cell.author.text = "By \(author)"
        cell.pubDate.text = dateFormatter.stringFromDate(date!)

        
        cell.emotionColor.backgroundColor = self.currentEmotionColor
        
        return cell
    }
    
    
    /*
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
    
    }
    */
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showNewsStory" {
            if let destination = segue.destinationViewController as? AESingleStoryViewController {
                if let newsIndex = tableView.indexPathForSelectedRow()?.row {
                    
                    //println(newsIndex)
                    //destination.headLine = testData[newsIndex].headline
                    var newsH = stories.story[newsIndex];
                    
                    destination.newsTitle = newsH.title
                    destination.newsImage = newsH.picture_url
                    destination.newsStory = newsH.content_without_tags
                    destination.newsDate = newsH.pubdate
                    destination.newsAuthor = newsH.author
                    destination.title = self.title
                    
                    let cell = sender as! UITableViewCell
                    cell.selected = false
                }
            }
        }
        
        if segue.identifier == "settingsPopover" {
            if let destination = segue.destinationViewController as? AESettingsViewController {
                if var popOver = destination.popoverPresentationController as UIPopoverPresentationController? {
                    //popOver.popoverLayoutMargins = UIEdgeInsets(top: 100.0, left: 20.0, bottom: 400.0, right: 20.0)
                    popOver.delegate = self
                }
            }
        }
        
        
//        // Assuming you've hooked this all up in a Storyboard with a popover presentation style
//        if ([segue.identifier isEqualToString:@"showPopover"]) {
//            UINavigationController *destNav = segue.destinationViewController;
//            PopoverContentsViewController *vc = destNav.viewControllers.firstObject;
//            
//            // This is the important part
//            UIPopoverPresentationController *popPC = destNav.popoverPresentationController;
//            popPC.delegate = self;
//        }
        
        
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
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
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        /*if editingStyle == .Delete {
        // Delete the row from the data source
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
        else if editingStyle == .Insert {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }*/
    }
    
    //table view swipe from the right to left option
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]?  {

        var markAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Mark as \u{000A}R/UR" , handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
        })
        markAction.backgroundColor = UIColor.grayColor()
        
        var addAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Add    \u{000A}List" , handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            let addMenu = UIAlertController(title: nil, message: "Add to reading list", preferredStyle: .ActionSheet)
            
            let appAddAction = UIAlertAction(title: "Confirm", style: UIAlertActionStyle.Default, handler: nil)
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
            
            addMenu.addAction(appAddAction)
            addMenu.addAction(cancelAction)
            
            
            self.presentViewController(addMenu, animated: true, completion: nil)
        })
        addAction.backgroundColor = UIColor.lightGrayColor()
        
        return [markAction,addAction]
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