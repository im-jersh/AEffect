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
        var myMutableString = NSMutableAttributedString()
        myMutableString = NSMutableAttributedString(string: newsStory, attributes: [NSKernAttributeName : 1, NSFontAttributeName:UIFont(name: "HelveticaNeue-Light", size: 18.0)!])
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        
        myMutableString.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range:NSMakeRange(0, count(newsStory)))
        newsText.attributedText = myMutableString
        
        let defaults = NSUserDefaults.standardUserDefaults()
        if let check = defaults.boolForKey("nightMode") as Bool?{
            if check==true{
                //println("changing stuff inside story!, in night mode")
                self.view.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 0.8)
                titleLabel.textColor = UIColor.whiteColor()
                authorLabel.textColor = UIColor.whiteColor()
                dateLabel.textColor = UIColor.whiteColor()
                newsText.textColor = UIColor.whiteColor()
            }
            else{
                //println("changing stuff inside story!, not in night mode")
                self.view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
                titleLabel.textColor = UIColor.blackColor()
                authorLabel.textColor = UIColor.blackColor()
                dateLabel.textColor = UIColor.blackColor()
                newsText.textColor = UIColor.blackColor()
            }
        }

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
