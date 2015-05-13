//
//  AEStory.swift
//  Æffect
//
//  Created by Hang Cui on 4/16/15.
//  Copyright (c) 2015 Josh O'Steen. All rights reserved.
//

import UIKit

class AEStory: NSObject {
    //var article_id: Int
    //var emotion: String
    var title: String
    var author: String
    var pubdate: String
    //var news_desk: String
    var picture_url: String
    //var caption: String
    //var article_url: String
    //var content_with_tags: String
    var content_without_tags: String
    var alreadyRead: Bool
    /*
    var anger:
    var surprise: String
    var sadness: String
    var joy: String
    var fear: String
    var excited: String
    var happy: String
    var worried: String
    *//*
    /*pubdate: String, news_desk: String, picture_url: String, caption: String,*/
    /*, content_with_tags: String, content_without_tags: String*/
    , anger: String, surprise: String, sadness: String, joy: String, fear: String, excited: String, happy: String, worried: String*/
    init(title: String, author: String, pubdate:String, content_without_tags: String, picture_url: String) {
        //self.article_id = article_id;
        //self.emotion = emotion
        self.title = title
        self.author = author
        self.pubdate = pubdate
        //self.news_desk = news_desk
        self.picture_url = picture_url
        //self.caption = caption
        //self.article_url = article_url
        //self.content_with_tags = content_with_tags
        self.content_without_tags = content_without_tags
        self.alreadyRead = false
        /*
        let anger: String
        let surprise: String
        let sadness: String
        let joy: String
        let fear: String
        let excited: String
        let happy: String
        let worried: String*/
        
    }
}
