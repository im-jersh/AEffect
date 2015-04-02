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


    var headLine = ""
    var image = ""
    var newsStory = ""
    //var indexNews : Int = 0
    
    
    @IBOutlet weak var viewNewsLayer: UIView!
   
    /*
    var noteworthyLightFont: AnyObject?
    var helveticaFont: AnyObject?
    let baseFontSize: CGFloat = 24.0
    let textLayer = CATextLayer()
    var fontSize: CGFloat = 24.0
    //var previouslySelectedTruncationMode = TruncationMode.End
    
    // MARK: - Quick reference
    
    func setUpTextLayer() {
        textLayer.frame = viewNewsLayer.bounds
        textLayer.string = newsStory
        textLayer.font = helveticaFont
        textLayer.foregroundColor = UIColor.darkGrayColor().CGColor
        textLayer.wrapped = true
        textLayer.alignmentMode = kCAAlignmentLeft
        textLayer.truncationMode = kCATruncationEnd
        textLayer.contentsScale = UIScreen.mainScreen().scale
    }
    
    func createFonts() {
        var fontName: CFStringRef = "Noteworthy-Light"
        noteworthyLightFont = CTFontCreateWithName(fontName, baseFontSize, nil)
        fontName = "Helvetica"
        helveticaFont = CTFontCreateWithName(fontName, baseFontSize, nil)
    }
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createFonts()
        setUpTextLayer()
        viewNewsLayer.layer.addSublayer(textLayer)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        textLayer.frame = viewNewsLayer.bounds
        textLayer.fontSize = fontSize
        println(1)
    }
    */
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var newImage: UIImageView!
    @IBOutlet weak var newText: UITextView!
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        newText.text = newsStory
        //newImage.image = UIImage(named: image)

        self.scrollView.layoutIfNeeded()
        self.scrollView.contentSize = self.contentView.bounds.size
    }
}
