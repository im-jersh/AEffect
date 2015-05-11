//
//  DataHandler.swift
//  Æffect
//
//  Created by Lawrence Williams on 5/10/15.
//  Copyright (c) 2015 Josh O'Steen. All rights reserved.
//

import UIKit

class DataHandler: NSObject {
    
    class func getStories() -> [AEStory] {
        
        // Find the Library directory
        let libraryURLDirectories:NSArray = NSFileManager.defaultManager().URLsForDirectory(.LibraryDirectory, inDomains: .UserDomainMask)
        
        // Get the last object out of this array, this is the URL
        let libraryURLOptional = libraryURLDirectories.lastObject as? NSURL
        
        // If not nil, proceed
        if let libraryURL = libraryURLOptional {
            var libraryPath = libraryURL.path?.stringByAppendingPathComponent("AEReadingList.json")
            if libraryPath != nil {
                let fileExists = NSFileManager.defaultManager().fileExistsAtPath(libraryPath!)
                if !fileExists {
                    let storyJSONData = DataHandler.loadStoriesFromBundle()
                    DataHandler.processJSONData(storyJSONData)
                }
                
                let stories = NSKeyedUnarchiver.unarchiveObjectWithFile(libraryPath!) as! [AEStory]
                return stories
            }
        }
        
        return [AEStory]()
    }
    
    class func processJSONData(data:NSData) {
        let storiesJSON = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as! NSDictionary
        var stories = [AEStory]()
        if let rootDictionary = storiesJSON.objectForKey("stories") as? NSArray {
            for storyDictionary in rootDictionary {
                
                let story = AEStory()
                
                if let title = storyDictionary.objectForKey("title") as? String {
                    story.title = title
                }
                
                if let author = storyDictionary.objectForKey("author") as? String {
                    story.author = author
                }
                
                if let pubdate = storyDictionary.objectForKey("pubdate") as? String {
                    story.pubdate = pubdate
                }
                
                if let news_desk = storyDictionary.objectForKey("news_desk") as? String {
                    story.news_desk = news_desk
                }
                
                if let article_url = storyDictionary.objectForKey("article_url") as? String {
                    story.article_url = article_url
                }
                
                if let picture_url = storyDictionary.objectForKey("picture_url") as? String {
                    story.picture_url = picture_url
                }
                
                if let caption = storyDictionary.objectForKey("caption") as? String {
                    story.caption = caption
                }
                
                if let content_without_tags = storyDictionary.objectForKey("content_without_tags") as? String {
                    story.content_without_tags = content_without_tags
                }
                
                if let emotion = storyDictionary.objectForKey("emotion") as? String {
                    story.emotion = emotion
                }
                
                stories.append(story)
            }
        }
        
        // archive to disk
        var error:NSErrorPointer?
        let mainBundle = NSBundle.mainBundle()
        // Find the Library directory
        let libraryURLDirectories:NSArray = NSFileManager.defaultManager().URLsForDirectory(.LibraryDirectory, inDomains: .UserDomainMask)
        
        // Get the last object out of this array, this is the URL
        let libraryURLOptional = libraryURLDirectories.lastObject as? NSURL
        
        // If not nil, proceed
        if let libraryURL = libraryURLOptional {
            var libraryPath = libraryURL.path?.stringByAppendingPathComponent("AEReadingList.json")
            NSKeyedArchiver.archiveRootObject(stories, toFile: libraryPath!)
        }
        
        
    }
    
    class func loadStoriesFromBundle() -> NSData {
        var error:NSErrorPointer?
        let mainBundle = NSBundle.mainBundle()
        let pathForDataFromBundle = mainBundle.pathForResource("AEReadingList", ofType: "json")
        let dataFromBundle = NSFileManager.defaultManager().contentsAtPath(pathForDataFromBundle!)
        return dataFromBundle!
    }
    
}
