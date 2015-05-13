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
    
    var stories : [AEStory] = [AEStory]()
    
    struct AEData {
        var emoji: String
        var bgColor: UIColor
        var emotion: String
    }
    
    
    let emotionArray = ["happy", "surprised", "sadness", "worried", "fear", "anger"]
    
    var loDictionary = [
        "happy" : [AEStory](),
        "surprised" : [AEStory](),
        "sadness" : [AEStory](),
        "worried" : [AEStory](),
        "fear" : [AEStory](),
        "anger" : [AEStory]()
    ]

    
    let aeDictionary: [AEData] = [
        AEData(emoji: "😄", bgColor: UIColor(red: 0.925, green: 0.776, blue: 0.184, alpha: 1.0), emotion: "Happy"),
        AEData(emoji: "😳", bgColor: UIColor(red: 0.467, green: 0.749, blue: 0.173, alpha: 1.0), emotion: "Surprised"),
        AEData(emoji: "😢", bgColor: UIColor(red: 0.039, green: 0.510, blue: 0.663, alpha: 1.0), emotion: "Sadness"),
        AEData(emoji: "😒", bgColor: UIColor(red: 0.494, green: 0.298, blue: 0.631, alpha: 1.0), emotion: "Worried"),
        AEData(emoji: "😖", bgColor: UIColor(red: 0.871, green: 0.000, blue: 0.286, alpha: 1.0), emotion: "Fear"),
        AEData(emoji: "😠", bgColor: UIColor(red: 0.914, green: 0.439, blue: 0.118, alpha: 1.0), emotion: "Anger")
    ]
    
    let colorDictionary: [String: UIColor] = [
        "happy" : UIColor(red: 0.925, green: 0.776, blue: 0.184, alpha: 1.0),
        "surprised" : UIColor(red: 0.467, green: 0.749, blue: 0.173, alpha: 1.0),
        "sadness" : UIColor(red: 0.039, green: 0.510, blue: 0.663, alpha: 1.0),
        "worried" : UIColor(red: 0.494, green: 0.298, blue: 0.631, alpha: 1.0),
        "fear" : UIColor(red: 0.871, green: 0.000, blue: 0.286, alpha: 1.0),
        "anger" : UIColor(red: 0.914, green: 0.439, blue: 0.118, alpha: 1.0)
    ]
    
    func countStoriesForEmotion(emo: String) -> Int {
        return loDictionary[emo]!.count;
    }
    
    func getStoriesByEmotion(emo: String) -> [AEStory] {
        var hold = [AEStory]()
        
        for s in self.stories {
            if s.emotion == emo {
                hold.append(s)
            }
        }
        
        return hold
    }
    
    func initializeAELO() -> Void {
        
        for emo in emotionArray {
            loDictionary[emo] = getStoriesByEmotion(emo)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fileManager = NSFileManager.defaultManager()
        let directoryPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentDir = directoryPaths[0] as! String
        let storyFilePath = documentDir.stringByAppendingPathComponent("AEReadingList.archive")
        
        //var hold : [AEStory]?
        
        if fileManager.fileExistsAtPath(storyFilePath) {
            stories = NSKeyedUnarchiver.unarchiveObjectWithFile(storyFilePath) as! [AEStory]!
        } else {
            stories = [AEStory]()
        }
//        
//        stories = GammaHandler.getStories()
        
        if !stories.isEmpty {
            initializeAELO()
        }
        
        for ae in aeDictionary {
            println(ae.emotion + " has \(countStoriesForEmotion(ae.emotion.lowercaseString)) stories" )
        }
        
        //tableView.reloadData()
        
        // make cell separator lines gray
        self.tableView.separatorColor = UIColor.grayColor()
        // change tableView background view
        self.tableView.backgroundColor = UIColor.whiteColor()
        
        // add system edit button to navigation bar
        self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        // edit back button text for article detail controller
        let backButton = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButton
        
    }
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 6 // Return the number of sections
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Return the number of rows in the section.
        return loDictionary[emotionArray[section]]!.count
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        // setup view contents
        var emotionData = aeDictionary[section]
        var view = UIView(frame: CGRectMake(0.0, 0.0, tableView.frame.size.width, 30.0))
        var label = UILabel(frame: CGRectMake(4.0, -4.0, tableView.frame.size.width, 30.0))
        var headerText : String = "\(emotionData.emotion as String) \(emotionData.emoji as String)"
        var headerColor : UIColor = emotionData.bgColor as UIColor
        
        // configure label
        label.backgroundColor = UIColor.clearColor()
        label.textAlignment = NSTextAlignment.Left
        label.textColor = UIColor.whiteColor()
        label.font = UIFont(name: "Helvetica Bold", size: 14.0)
        label.text = headerText
        
        // configure header view
        view.backgroundColor = headerColor
        view.addSubview(label)
        
        
        return view
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("readingListArticle", forIndexPath: indexPath) as! AETableViewCell
        
        indexPath.section
        
        
        
//        let cellData = stories[indexPath.row]
        
        let emotion = emotionArray[indexPath.section]
        
        let cellData = loDictionary[emotion]![indexPath.row]
        
        
        var imgURL: NSURL = NSURL(string: cellData.picture_url)!
        let request: NSURLRequest = NSURLRequest(URL: imgURL)
        NSURLConnection.sendAsynchronousRequest(
            request, queue: NSOperationQueue.mainQueue(),
            completionHandler: {(response: NSURLResponse!,data: NSData!,error: NSError!) -> Void in
                if error == nil {
                    cell.featuredImage.image = UIImage(data: data)
                }
        })

        
        // Configure the cell...
        let img = UIImage(named: cellData.picture_url)
        cell.clipsToBounds = true;
        cell.headline.text = cellData.title
        
        
        let author = cellData.author.uppercaseString
        cell.author.text = "By \(author)"
        cell.pubDate.text = cellData.pubdate
        
        cell.emotionColor.backgroundColor = colorDictionary[emotion]
        
        // store weak reference to tableView in cell object
        cell.tableView = self.tableView
        
        // change selection style of cell
        cell.selectionStyle = .Gray
        
        // set multiple selection background view
        var multiSelectBGView = UIView(frame: cell.frame)
        multiSelectBGView.backgroundColor = UIColor.clearColor()
        cell.multipleSelectionBackgroundView = multiSelectBGView
        
        return cell
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let cell = tableView.cellForRowAtIndexPath(indexPath) as? AETableViewCell
        
        if tableView.editing {
            // don't push to article detail
            cell?.tintColor = UIColor.redColor()
            
        } else if !tableView.editing {
            // perform segue
            self.performSegueWithIdentifier("showArticleDetail", sender: self)
            
        }
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showArticleDetail" {
            if let destination = segue.destinationViewController as? AESingleStoryViewController {
                if let newsIndex = tableView.indexPathForSelectedRow()?.row {
                    println("Selected Row is \(newsIndex)")
                    //var newsH = stories[newsIndex];
                    let section = tableView.indexPathForSelectedRow()?.section
                    
                    var newsH = loDictionary[emotionArray[section!]]![newsIndex]
                    
                    destination.newsTitle = newsH.title
                    destination.newsImage = newsH.picture_url
                    destination.newsStory = newsH.content_without_tags
                    destination.newsDate = newsH.pubdate
                    destination.newsAuthor = newsH.author
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
            
            // show toolbar
            self.navigationController?.setToolbarHidden(false, animated: true)
            
        } else if !editing { // exit edit mode
            
            // exit edit mode in table view
            self.tableView.setEditing(editing, animated: animated)
            
            // add left done button to nav bar
            self.navigationItem.setLeftBarButtonItem(self.doneButton, animated: true)
            
            // show toolbar
            self.navigationController?.setToolbarHidden(true, animated: true)
            
        }
        
    }
    
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true // all cells in the table view should be editable
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        /*
        if editingStyle == .Delete {
            // Delete the row from the data source
            testData.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }*/
    }
    
//    // swipe options method
//    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]?  {
//        
//        var deleteAction = UIAlertAction( title: "Remove", style: UIAlertActionStyle.Default, handler: {(alert: UIAlertAction!) -> Void in self.removeStoryFromReadingList(indexPath.row)})
//        tableView.reloadData()
//        
//    }
    
    // swipe options method
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]?  {
        
        var deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Remove" , handler: { (action:UITableViewRowAction!, indexPath:NSIndexPath!) -> Void in
            // 2
            let deleteMenu = UIAlertController(title: nil, message: "Remove From current List", preferredStyle: .ActionSheet)
            
            let twitterAction = UIAlertAction(title: "Confirm", style: UIAlertActionStyle.Default, handler: {(alert: UIAlertAction!) -> Void in self.removeStoryFromReadingList(indexPath.row)
                // remove row from table
                //self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            })
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
            
            deleteMenu.addAction(twitterAction)
            deleteMenu.addAction(cancelAction)
            
            
            self.presentViewController(deleteMenu, animated: true, completion: nil)
        })
        
        deleteAction.backgroundColor = UIColor.lightGrayColor()
        
        return [deleteAction]
    }
    
    func removeStoryFromReadingList(row: Int) -> Void {
        if let newsIndex = tableView.indexPathForSelectedRow()?.row {
            println("Selected Row is \(newsIndex)")
            //var newsH = stories[newsIndex];
            let section = tableView.indexPathForSelectedRow()?.section
            
            var newsH = loDictionary[emotionArray[section!]]![newsIndex]
            GammaHandler.removeStory(newsH.title)
            //self.tableView.deleteRowsAtIndexPaths(<#indexPaths: [AnyObject]#>, withRowAnimation: .Fade)
        }
    }
}
