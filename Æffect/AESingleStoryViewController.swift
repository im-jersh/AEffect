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
    var image = ""
    var newsStory = ""
    //var indexNews : Int = 0
    
    @IBOutlet var newsContent: UILabel!
    
    //@IBOutlet var newsImage: UIImageView!
    
    override func viewDidAppear(animated: Bool) {
        
        newsContent.text = newsStory
        
        println(image)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

   
}
