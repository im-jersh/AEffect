//
//  AESingleStoryViewController.swift
//  Æffect
//
//  Created by Hang Cui on 4/1/15.
//  Copyright (c) 2015 Josh O'Steen. All rights reserved.
//

import UIKit

class AESingleStoryViewController: UIViewController {

    var headLine = ""
    var image = UIImage?()

    
    @IBOutlet var newsContent: UILabel!
    
    //@IBOutlet var newsImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsContent.text = headLine
        println(headLine)
        println("1")

     //   self.newsImage.image = UIImage(named: image)
      //  self.newsImage.layer.cornerRadius = self.newsImage.frame.width / 2
      //  self.newsImage.layer.masksToBounds = true
      //  self.newsImage.layer.borderWidth = 2
      //  self.newsImage.layer.borderColor = UIColor.blackColor().CGColor
        
        
    }

   
}
