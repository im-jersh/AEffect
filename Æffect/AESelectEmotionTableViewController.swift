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
    let emotionArray = ["happy", "surprised", "sadness", "worried", "fear", "anger"]
    
    let aedictionary: [String: AEData] = [
        
        "happy": AEData(emoji: "😄", bgColor: UIColor(red: 0.925, green: 0.776, blue: 0.184, alpha: 0.8)),
        "surprised": AEData(emoji: "😳", bgColor: UIColor(red: 0.467, green: 0.749, blue: 0.173, alpha: 0.8)),
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
    var pagehappy = 0
    var pagefear = 0
    var pagesadness = 0
    var pagesurprise = 0
    var pageworried = 0
    var pageanger = 0

    ////////////////////////////////////////////////////////////////////////////////////////
    /*Get news data from server*/
    var urlString = ""

    var urlStringHappy = "https://peaceful-cove-8511.herokuapp.com/db/?emotion=happy&offset=0"
    var urlStringFear = "https://peaceful-cove-8511.herokuapp.com/db/?emotion=fear&offset=0"
    var urlStringSadness = "https://peaceful-cove-8511.herokuapp.com/db/?emotion=sadness&offset=0"
    var urlStringSuprise = "https://peaceful-cove-8511.herokuapp.com/db/?emotion=surprise&offset=0"
    var urlStringWorried = "https://peaceful-cove-8511.herokuapp.com/db/?emotion=worried&offset=0"
    var urlStringAnger = "https://peaceful-cove-8511.herokuapp.com/db/?emotion=anger&offset=0"

    var stories: AEStories = AEStories()
    var storieshappy: AEStories = AEStories()
    var storiesfear: AEStories = AEStories()
    var storiessadness: AEStories = AEStories()
    var storiessuprise: AEStories = AEStories()
    var storiesworried: AEStories = AEStories()
    var storiesanger: AEStories = AEStories()
    
    var verydefault = ""
    
    ////////////////////////////////////////////////////////////////////////////////////////
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "loadList:",name:"load", object: nil)
        
        
        if let check = defaults.boolForKey("nightMode") as Bool?{
            println("Check on load " + "\(check)")
            self.tableView.reloadData()
        }
        
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
            }
        }
        
        if let defaultEmontion = defaults.stringForKey("emotion") {
            println(defaultEmontion)
            if defaultEmontion == "anger" {
                self.stories = self.storiesanger
                verydefault = "anger"
                currentEmotionColor = UIColor(red: 0.914, green: 0.439, blue: 0.118, alpha: 0.8)
            }
            else if defaultEmontion == "surprise" {
                self.stories = self.storiessuprise
                verydefault = "surprise"
                currentEmotionColor = UIColor(red: 0.467, green: 0.749, blue: 0.173, alpha: 0.8)
            }
            else if (defaultEmontion == "sadness") {
                println("1")
                self.stories = self.storiessadness
                verydefault = "sadness"
                currentEmotionColor = UIColor(red: 0.039, green: 0.510, blue: 0.663, alpha: 0.8)
            }
            else if defaultEmontion == "worried" {
                self.stories = self.storiesworried
                verydefault = "worried"
                currentEmotionColor = UIColor(red: 0.494, green: 0.298, blue: 0.631, alpha: 0.8)
            }
            else if defaultEmontion == "fear" {
                self.stories = self.storiesfear
                verydefault = "fear"
                currentEmotionColor = UIColor(red: 0.871, green: 0.000, blue: 0.286, alpha: 0.8)
            }
            else {
                self.stories = self.storieshappy
                verydefault = "happy"
                currentEmotionColor = UIColor(red: 0.925, green: 0.776, blue: 0.184, alpha: 0.8)
            }
            self.tableView.reloadData()
            
            NSTimer.scheduledTimerWithTimeInterval(1.8, target: self, selector: "loadList:", userInfo: nil, repeats: false)

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
    func loadList(notification: NSNotification){
        //load data here
        self.tableView.reloadData()
    }
    override func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.pull_action?.scrollViewDidEndDragging()
    }
    
    func refreshTriggered(sender: AnyObject){
        finishRefreshControl()
        
    }
    
    func finishRefreshControl ()
    {
        let delay = 2 * Double(NSEC_PER_SEC)
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
        dispatch_after(time, dispatch_get_main_queue()) {
            self.pull_action?.finishingLoading()
        }
        if (currentEmotionColor == UIColor(red: 0.925, green: 0.776, blue: 0.184, alpha: 0.8)){
            pagehappy++
            var offset = pagehappy * 10
            urlString = "https://peaceful-cove-8511.herokuapp.com/db/?emotion=happy&offset="
            urlString = urlString + String(offset)
        }
        else if (currentEmotionColor == UIColor(red: 0.467, green: 0.749, blue: 0.173, alpha: 0.8)){
            pagesurprise++
            var offset = pagesurprise * 10
            urlString = "https://peaceful-cove-8511.herokuapp.com/db/?emotion=surprise&offset="
            urlString = urlString + String(offset)

        }
        else if (currentEmotionColor == UIColor(red: 0.039, green: 0.510, blue: 0.663, alpha: 0.8)){
            pagesadness++
            var offset = pagesadness * 10
            urlString = "https://peaceful-cove-8511.herokuapp.com/db/?emotion=sadness&offset="
            urlString = urlString + String(offset)

        }
        else if (currentEmotionColor == UIColor(red: 0.494, green: 0.298, blue: 0.631, alpha: 0.8)){
            pageworried++
            var offset = pageworried * 10
            urlString = "https://peaceful-cove-8511.herokuapp.com/db/?emotion=worried&offset="
            urlString = urlString + String(offset)

        }
        else if (currentEmotionColor == UIColor(red: 0.914, green: 0.439, blue: 0.118, alpha: 0.8)){
            pagefear++
            var offset = pagefear * 10
            urlString = "https://peaceful-cove-8511.herokuapp.com/db/?emotion=anger&offset="
            urlString = urlString + String(offset)

        }
        else if (currentEmotionColor == UIColor(red: 0.871, green: 0.000, blue: 0.286, alpha: 0.8)){
            pageanger++
            var offset = pageanger * 10
            urlString = "https://peaceful-cove-8511.herokuapp.com/db/?emotion=fear&offset="
            urlString = urlString + String(offset)

        }
        
        println(urlString)
        //self.tableView.reloadData()
        
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
        self.tableView.reloadData()
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
        if verydefault == "happy" {
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.925, green: 0.776, blue: 0.184, alpha: 0.8)
            self.title = emotionArray[0].capitalizedString
            label.text = "😄"
            label.textAlignment = NSTextAlignment.Center
            label.layer.cornerRadius = label.frame.size.height / 2.0
            label.backgroundColor = UIColor(red: 0.925, green: 0.776, blue: 0.184, alpha: 0.8)
            label.clipsToBounds = true
        }
        
        if verydefault == "surprise" {
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.925, green: 0.776, blue: 0.184, alpha: 0.8)
            self.title = emotionArray[1].capitalizedString
            label.text = "😳"
            label.textAlignment = NSTextAlignment.Center
            label.layer.cornerRadius = label.frame.size.height / 2.0
            label.backgroundColor = UIColor(red: 0.467, green: 0.749, blue: 0.173, alpha: 0.8)
            label.clipsToBounds = true
        }
        
        if verydefault == "sadness" {
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.039, green: 0.510, blue: 0.663, alpha: 0.8)
            self.title = emotionArray[2].capitalizedString
            label.text = "😢"
            label.textAlignment = NSTextAlignment.Center
            label.layer.cornerRadius = label.frame.size.height / 2.0
            label.backgroundColor = UIColor(red: 0.039, green: 0.510, blue: 0.663, alpha: 0.8)
            label.clipsToBounds = true
        }
        if verydefault == "worried" {
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.494, green: 0.298, blue: 0.631, alpha: 0.8)
            self.title = emotionArray[3].capitalizedString
            label.text = "😒"
            label.textAlignment = NSTextAlignment.Center
            label.layer.cornerRadius = label.frame.size.height / 2.0
            label.backgroundColor = UIColor(red: 0.494, green: 0.298, blue: 0.631, alpha: 0.8)
            label.clipsToBounds = true
        }
        if verydefault == "fear" {
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.871, green: 0.000, blue: 0.286, alpha: 0.8)
            self.title = emotionArray[4].capitalizedString
            label.text = "😖"
            label.textAlignment = NSTextAlignment.Center
            label.layer.cornerRadius = label.frame.size.height / 2.0
            label.backgroundColor = UIColor(red: 0.871, green: 0.000, blue: 0.286, alpha: 0.8)
            label.clipsToBounds = true
        }
    
        if verydefault == "anger" {
            self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.914, green: 0.439, blue: 0.118, alpha: 0.8)
            self.title = emotionArray[5].capitalizedString
            label.text = "😠"
            label.textAlignment = NSTextAlignment.Center
            label.layer.cornerRadius = label.frame.size.height / 2.0
            label.backgroundColor = UIColor(red: 0.914, green: 0.439, blue: 0.118, alpha: 0.8)
            label.clipsToBounds = true
        }
        
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
        
        if let cellData = stories.story[indexPath.row] as AEStory? {
        
            let defaults = NSUserDefaults.standardUserDefaults()
            let cellData = stories.story[indexPath.row]
            if let check = defaults.boolForKey("nightMode") as Bool?{
                println("Check on load" + "\(check)")
                if(check==true){
                    cell.backgroundColor = UIColor(red: 0.147, green: 0.147, blue: 0.147, alpha: 0.8)
                    cell.headline.textColor = UIColor.whiteColor()
                    cell.author.textColor = UIColor.whiteColor()
                    cell.pubDate.textColor = UIColor.whiteColor()
                }
                else{
                    cell.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
                    cell.headline.textColor = UIColor.blackColor()
                    cell.author.textColor = UIColor.blackColor()
                    cell.pubDate.textColor = UIColor.blackColor()
                }
            }
        // Configure the cell...
        
        //this line is important if user Scroll the table view to fast, and the image will be replaced with other image, however, this line will set the image as a blank image if user Scroll to fast
        
        var picURL = ""
        var tempURL = ""
        //println(cellData.picture_url)
        
        if  cellData.picture_url != "null" {
            var pictureURL = cellData.picture_url
            var length = count(pictureURL) - 14
            
            var tail_range = Range(start: advance(pictureURL.startIndex, length), end: pictureURL.endIndex)
            var tail_string = pictureURL.substringWithRange(tail_range)
            //println (tail_string)
            
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
        //println(picURL)
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

            if cellData.alreadyRead == false {
                cell.emotionColor.backgroundColor = self.currentEmotionColor
            }
            else {
                cell.emotionColor.backgroundColor = UIColor.grayColor()
            }
        }
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
                    stories.story[newsIndex].alreadyRead = true
                    destination.newsTitle = newsH.title
                    destination.newsImage = newsH.picture_url
                    destination.newsStory = newsH.content_without_tags
                    destination.newsDate = newsH.pubdate
                    destination.newsAuthor = newsH.author
                    destination.newsURL = newsH.article_url
                    destination.title = self.title
                    destination.article = newsH
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
    
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    //table view swipe from the right to left option
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]?  {

        
        var markAction : UITableViewRowAction
        if stories.story[indexPath.row].alreadyRead == false {
            markAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Mark as \u{000A}Read" , handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
                    self.stories.story[indexPath.row].alreadyRead = true
                    self.tableView.reloadData()
            })
        }
        else {
            markAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Mark as \u{000A}Unread" , handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
                    self.stories.story[indexPath.row].alreadyRead = false
                    self.tableView.reloadData()
            })
        }
        markAction.backgroundColor = UIColor.grayColor()
        
        var addAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Add    \u{000A}List" , handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            
            let addMenu = UIAlertController(title: nil, message: "Add to reading list", preferredStyle: .ActionSheet)
            
            let appAddAction = UIAlertAction(title: "Confirm", style: UIAlertActionStyle.Default, handler: {(alert: UIAlertAction!) in self.addStoryToReadingList(indexPath.row)})
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
            
            addMenu.addAction(appAddAction)
            addMenu.addAction(cancelAction)
            
            
            self.presentViewController(addMenu, animated: true, completion: nil)
        })
        addAction.backgroundColor = UIColor.lightGrayColor()
        
        return [markAction,addAction]
    }
    
    func addStoryToReadingList(row: Int) -> Void {
        var hold = stories.story[row]
        if let emotion = self.title?.lowercaseString {
            hold.emotion = emotion
        }
        
        GammaHandler.addStory(hold)
    }
    
}