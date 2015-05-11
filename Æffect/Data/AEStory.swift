//
//  AEStory.swift
//  Æffect
//
//  Created by Hang Cui on 4/16/15.
//  Copyright (c) 2015 Josh O'Steen. All rights reserved.
//

import UIKit

class AEStory: NSObject, NSCoding {
    
    var title: String = "Untitled"
    var author: String = "Unknown Author"
    var pubdate: String = "1979-01-01"
    var news_desk: String = "TheNewsAgency"
    var article_url: String = "http://google.com"
    var picture_url: String = "noimage.jpg"
    var caption: String = "The turtle was swimming"
    var content_without_tags: String = "Story goes here"
    var emotion: String = ""
    
    init(title: String, author: String, pubdate:String, content_without_tags: String, picture_url: String) {
        
        self.title = title
        self.author = author
        self.pubdate = pubdate
        self.picture_url = picture_url
        self.content_without_tags = content_without_tags
    }
    
    override init() {
        
    }
    
    
    // Never call yourself
    required convenience init(coder decoder: NSCoder) {
        self.init()
        self.title = decoder.decodeObjectForKey("title") as! String
        self.author = decoder.decodeObjectForKey("author") as! String
        self.pubdate = decoder.decodeObjectForKey("pubdate") as! String
        self.news_desk = decoder.decodeObjectForKey("news_desk") as! String
        self.article_url = decoder.decodeObjectForKey("article_url") as! String
        self.picture_url = decoder.decodeObjectForKey("picture_url") as! String
        self.caption = decoder.decodeObjectForKey("caption") as! String
        self.content_without_tags = decoder.decodeObjectForKey("content_without_tags") as! String
        self.emotion = decoder.decodeObjectForKey("emotion") as! String
    }
    
    // Never call yourself
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(title, forKey: "title")
        aCoder.encodeObject(author, forKey: "author")
        aCoder.encodeObject(pubdate, forKey: "pubdate")
        aCoder.encodeObject(news_desk, forKey: "news_desk")
        aCoder.encodeObject(article_url, forKey: "article_url")
        aCoder.encodeObject(picture_url, forKey: "picture_url")
        aCoder.encodeObject(caption, forKey: "caption")
        aCoder.encodeObject(content_without_tags, forKey: "content_without_tags")
        aCoder.encodeObject(emotion, forKey: "emotion")
    }
    
}
