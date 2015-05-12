//
//  AEStoriesSurprise.swift
//  Æffect
//
//  Created by Hang Cui on 5/5/15.
//  Copyright (c) 2015 Josh O'Steen. All rights reserved.
//

import UIKit

class AEStoriesSurprise: NSObject {
   
    var storySurprise = [AEStory]()
    
    func loadSadness(fromURLString: String, completionHandler: (AEStoriesSurprise, String?) -> Void) {
        
        storySurprise =  [AEStory]()
        if let url = NSURL(string: fromURLString) {
            let urlRequest = NSMutableURLRequest(URL: url)
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithRequest(urlRequest, completionHandler: {
                (data, response, error) -> Void in
                if error != nil {
                    dispatch_async(dispatch_get_main_queue(), {
                        completionHandler(self, error.localizedDescription)
                    })
                } else {
                    self.parse(data, completionHandler: completionHandler)
                }
            })
            
            task.resume()
        } else {
            dispatch_async(dispatch_get_main_queue(), {
                completionHandler(self, "Invalid URL")
            })
        }
    }
    
    func parse(jsonData: NSData, completionHandler: (AEStoriesSurprise, String?) -> Void) {
        
        var jsonError: NSError?
        if let jsonResult = NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingOptions.MutableContainers, error: &jsonError) as? NSDictionary {
            if (jsonResult.count > 0)
            {
                if let storyData = jsonResult["response"] as? NSDictionary {
                    if let  docs = storyData["docs"] as? NSArray{
                        println(docs.count)
                        if(docs.count == 0){
                            println("no articles")
                        }
                        else{
                            println("abcde")
                            for specificStory in docs{
                                //println(specificStory["anger"])
                                
                                let article_key = specificStory["article_id"] as? NSString
                                let title = specificStory["title"] as? NSString
                                let author = specificStory["author"] as? NSString
                                let storyURL = specificStory["article_url"] as? NSString
                                //let emotion = specificStory["emotion"] as? NSString
                                let content_without_tags = specificStory["content_without_tags"] as? NSString
                                let pubdate = specificStory["pubdate"] as? NSString
                                let picture_url = specificStory["picture_url"] as? NSString
                                let newStory = AEStory(title: title! as String, author: author! as String, pubdate: pubdate! as String, content_without_tags: content_without_tags! as String, picture_url: picture_url! as String);
                                storySurprise.append(newStory)
                                
                            }
                        }
                    }
                }
                dispatch_async(dispatch_get_main_queue(), {
                    completionHandler(self, nil)
                })
                
            }
            
        } else {
            if let unwrappedError = jsonError {
                dispatch_async(dispatch_get_main_queue(), {
                    completionHandler(self, "\(unwrappedError)")
                })
            }
        }
    }
}
