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
            
            var i = 0
            
            println("Before Removal")
            
            for s in stories {
                println("stories[\(i++)]: \(s.title)")
            }
            
            for (var i = 0; i < stories.count; ++i) {
                if stories[i].title == headline {
                    stories.removeAtIndex(i)
                    return
                }
            }
            println("After Removal:")
            for s in stories {
                println("stories[\(i++)]: \(s.title)")
            }
            NSKeyedArchiver.archivedDataWithRootObject(stories)
        }
        
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
        let hold = NSKeyedUnarchiver.unarchiveObjectWithFile(storyFilePath) as! [AEStory]
        
        for s in hold {
            println("")
            println("\(s.title) is archived with emotion: \(s.emotion)")
            println("")
        }
        let temp = NSKeyedUnarchiver.unarchiveObjectWithFile(storyFilePath) as! [AEStory]
        
        for s in temp {
            println("")
            println("Still Here: \(s.title) is Still here \(s.emotion)")
            println("")
        }

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
    
    
    class func processStoryData(data:NSData) {
        let storyJSON = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as! NSDictionary
        var stories = [AEStory]()
        if let rootDictionary = storyJSON.objectForKey("stories") as? NSArray {
            for storyDictionary in rootDictionary {
                let story = AEStory()
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
        let pathForDataFromBundle = mainBundle.pathForResource("AEReadingList", ofType: "archive")
        let dataFromBundle = NSFileManager.defaultManager().contentsAtPath(pathForDataFromBundle!)
        return dataFromBundle!
    }
    
}
