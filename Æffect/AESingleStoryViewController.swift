//
//  AESingleStoryViewController.swift
//  Æffect
//
//  Created by Hang Cui on 4/1/15.
//  Copyright (c) 2015 Josh O'Steen. All rights reserved.
//

import UIKit
import QuartzCore

class AESingleStoryViewController: UIViewController {

    var newsTitle = ""
    var newsImage = ""
    var newsStory = ""
    var newsDate = ""
    var newsAuthor = ""
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsText: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        let hold:[String] = newsDate.componentsSeparatedByString("-")
        let dateComponents = NSDateComponents()
        
        dateComponents.year = hold[0].toInt()!
        dateComponents.month = hold[1].toInt()!
        dateComponents.day = hold[2].toInt()!
        
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "d MMMM y"
        
        var date = NSCalendar.currentCalendar().dateFromComponents(dateComponents)
        
        
        titleLabel.text = newsTitle
        authorLabel.text = "By: \(newsAuthor)"
        dateLabel.text = dateFormatter.stringFromDate(date!)

        newsText.text = newsStory
        //newsImageView.image = UIImage(named: newsImage)
        
       
            var imgURL: NSURL = NSURL(string: newsImage)!
            let request: NSURLRequest = NSURLRequest(URL: imgURL)
            NSURLConnection.sendAsynchronousRequest(
                request, queue: NSOperationQueue.mainQueue(),
                completionHandler: {(response: NSURLResponse!,data: NSData!,error: NSError!) -> Void in
                    if error == nil {
                        self.newsImageView.image = UIImage(data: data)
                    }
            })
        
        
        //println(cellData.picture_url)
        

        
    }
    
    override func viewDidLoad() {
        
    
    }
    
}
