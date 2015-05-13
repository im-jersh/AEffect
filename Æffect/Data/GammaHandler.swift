//
//  GammaHandler.swift
//  Æffect
//
//  Created by Lawrence Williams on 5/12/15.
//  Copyright (c) 2015 Josh O'Steen. All rights reserved.
//

import UIKit

class GammaHandler: NSObject {
 
    class func getStories() -> [AEStory] {
        
        let fileManager = NSFileManager.defaultManager()
        let directoryPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentDir = directoryPaths[0] as! String
        let storyFilePath = documentDir.stringByAppendingPathComponent("AEReadingList.archive")
        
        var stories : [AEStory]?
        
        if fileManager.fileExistsAtPath(storyFilePath) {
            stories = NSKeyedUnarchiver.unarchiveObjectWithFile(storyFilePath) as? [AEStory]
            return stories!
        }   else {
            NSKeyedArchiver.archiveRootObject([AEStory](), toFile: storyFilePath)
        }

        return NSKeyedUnarchiver.unarchiveObjectWithFile(storyFilePath) as! [AEStory]
    }
    
    
    
    class func removeStory(headline: String) -> Void {
        
        let fileManager = NSFileManager.defaultManager()
        let directoryPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentDir = directoryPaths[0] as! String
        let storyFilePath = documentDir.stringByAppendingPathComponent("AEReadingList.archive")
        
        if fileManager.fileExistsAtPath(storyFilePath) {
            
            var stories = NSKeyedUnarchiver.unarchiveObjectWithFile(storyFilePath) as! [AEStory]
            
            var index = getIndexByHeadline(stories, headline: headline)
            
            if index != -1 {
                println("Removal: \"\(stories[index].title)\"")
                stories.removeAtIndex(index)
                stories.removeAll(keepCapacity: false)
                NSKeyedArchiver.archivedDataWithRootObject(stories)
                printStories()
            } else {
                println("Error: \"\(headline)\" couldn't be removed")
            }
        }
    }
    
    class func printStories() -> Void {
        let fileManager = NSFileManager.defaultManager()
        let directoryPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentDir = directoryPaths[0] as! String
        let storyFilePath = documentDir.stringByAppendingPathComponent("AEReadingList.archive")
        let stories = NSKeyedUnarchiver.unarchiveObjectWithFile( storyFilePath) as! [AEStory]
        var i = 0
        for s in stories {
            println("Story[\(i)]: \(s.title)")
        }
    }
    
    class func getIndexByHeadline(stories : [AEStory], headline : String) -> Int {
        if !stories.isEmpty {
            for (var i = 0; i < stories.count; ++i) {
                if stories[i].title.isEqual(headline) {
                    return i
                }
            }
        }
        return -1
    }
    
    class func addStory(story: AEStory) -> Void {
        
        let fileManager = NSFileManager.defaultManager()
        let directoryPaths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentDir = directoryPaths[0] as! String
        let storyFilePath = documentDir.stringByAppendingPathComponent("AEReadingList.archive")
        
        var stories : [AEStory]?
        
        if fileManager.fileExistsAtPath(storyFilePath) {
            stories = NSKeyedUnarchiver.unarchiveObjectWithFile(storyFilePath) as? [AEStory]
            
            if !isPresent(story, stories: stories!) {
                stories!.append(story)
            }
        } else {
            stories = [AEStory]()
            stories!.append(story)
        }
        
        NSKeyedArchiver.archiveRootObject(stories!, toFile: storyFilePath)
    }
    
    class func isPresent(story: AEStory, stories: [AEStory]) -> Bool {
        
        if stories.isEmpty {
            return false
        }
        
        for s in stories {
            if s.title == story.title {
                return true
            }
        }
        
        return false
        
    }
    
}
