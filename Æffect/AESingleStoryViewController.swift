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
        
        titleLabel.text = newsTitle
        authorLabel.text = "By: \(newsAuthor)"
        dateLabel.text = "Last Update: \(newsDate)"
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
    }
    
    override func viewDidLoad() {
        
    }
    
}
