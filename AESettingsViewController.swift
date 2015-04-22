//
//  AESettingsViewController.swift
//  Æffect
//
//  Created by Joshua O'Steen on 4/21/15.
//  Copyright (c) 2015 Josh O'Steen. All rights reserved.
//

import UIKit

class AESettingsViewController: UITableViewController {
    
    struct AEData {
        var emoji: String
        var bgColor: UIColor
    }
    let emojiArray = ["😄", "😳", "😢", "😒", "😠", "😖"]
    let emotionArray = ["happy", "surprise", "sadness", "worried", "anger", "fear"]
    
    @IBOutlet weak var defaultEmotionButton: UIButton!
    let aedictionary: [String: AEData] = [
        
        "happy": AEData(emoji: "😄", bgColor: UIColor(red: 0.925, green: 0.776, blue: 0.184, alpha: 0.8)),
        "surprise": AEData(emoji: "😳", bgColor: UIColor(red: 0.467, green: 0.749, blue: 0.173, alpha: 0.8)),
        "sadness": AEData(emoji: "😢", bgColor: UIColor(red: 0.039, green: 0.510, blue: 0.663, alpha: 0.8)),
        "worried": AEData(emoji: "😒", bgColor: UIColor(red: 0.494, green: 0.298, blue: 0.631, alpha: 0.8)),
        "anger": AEData(emoji: "😠", bgColor: UIColor(red: 0.914, green: 0.439, blue: 0.118, alpha: 0.8)),
        "fear": AEData(emoji: "😖", bgColor: UIColor(red: 0.871, green: 0.000, blue: 0.286, alpha: 0.8))
    ]

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set popover content size
        let bounds = UIScreen.mainScreen().bounds
        var width : CGFloat = 0
        var height : CGFloat = 0
        
        if bounds.size.width < 375.0 { // 5s or older
            width = bounds.size.width * 0.8
            height = bounds.size.height * 0.55
        } else {
            width = bounds.size.width * 0.75
            height = bounds.size.height * 0.4
        }
        
        self.preferredContentSize = CGSizeMake(width, height)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if let emotion = defaults.stringForKey("emotion"){
            let idx = find(emotionArray, emotion)!
            defaultEmotionButton.setTitle(emotionArray[idx].capitalizedString + " " + emojiArray[idx], forState: UIControlState.Normal)
            defaultEmotionButton.setTitleColor(aedictionary[emotionArray[idx]]!.bgColor, forState: UIControlState.Normal)
        }
    }

    
    @IBAction func switchDefaultEmotion(sender: UIButton!) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        let tempArray: [String] = sender.titleLabel!.text!.componentsSeparatedByString(" ")
        let idx = (find(emojiArray, tempArray[1])! + 1) % emojiArray.count
        
        defaults.setObject(emotionArray[idx], forKey: "emotion")
        let newString = emotionArray[idx].capitalizedString + " " + emojiArray[idx]
        
        sender.setTitle(newString, forState: UIControlState.Normal)
        sender.setTitleColor(aedictionary[emotionArray[idx]]!.bgColor, forState: UIControlState.Normal)
        
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 1
    }

}
