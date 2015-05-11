//
//  DataHandler.swift
//  StarTrek
//
//  Created by Tyten Teegarden on 4/23/15.
//  Copyright (c) 2015 Tyten llc. All rights reserved.
//

import UIKit

class DataHandler: NSObject {

	class func getEpisodes() -> [Episode] {

		// Find the Library directory
		let libraryURLDirectories:NSArray = NSFileManager.defaultManager().URLsForDirectory(.LibraryDirectory, inDomains: .UserDomainMask)

		// Get the last object out of this array, this is the URL
		let libraryURLOptional = libraryURLDirectories.lastObject as? NSURL

		// If not nil, proceed
		if let libraryURL = libraryURLOptional {
			var libraryPath = libraryURL.path?.stringByAppendingPathComponent("StarTrek.json")
			if libraryPath != nil {

				let fileExists = NSFileManager.defaultManager().fileExistsAtPath(libraryPath!)
				if !fileExists {
					let episodeJSONData = DataHandler.loadEpisodesFromBundle()
					DataHandler.processJSONData(episodeJSONData)
				}

				let episodes = NSKeyedUnarchiver.unarchiveObjectWithFile(libraryPath!) as! [Episode]
				return episodes
			}
		}

		return [Episode]()
	}

	class func processJSONData(data:NSData) {
		let episodesJSON = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: nil) as! NSDictionary
		var episodes = [Episode]()
		if let rootDictionary = episodesJSON.objectForKey("episodes") as? NSArray {
			for episodeDictionary in rootDictionary {
				let show = Episode()

				if let title = episodeDictionary.objectForKey("name") as? String {
					show.title = title
				}

				if let episode = episodeDictionary.objectForKey("episode") as? NSNumber {
					show.episode = episode.integerValue
				}

				if let season = episodeDictionary.objectForKey("season") as? NSNumber {
					show.season = season.integerValue
				}

				if let synopsis = episodeDictionary.objectForKey("synopsis") as? String {
					show.synopsis = synopsis
				}
				episodes.append(show)
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
			var libraryPath = libraryURL.path?.stringByAppendingPathComponent("StarTrek.json")
			NSKeyedArchiver.archiveRootObject(episodes, toFile: libraryPath!)
		}


	}

	class func loadEpisodesFromBundle() -> NSData {
		var error:NSErrorPointer?
		let mainBundle = NSBundle.mainBundle()
		let pathForDataFromBundle = mainBundle.pathForResource("StarTrek", ofType: "json")
		let dataFromBundle = NSFileManager.defaultManager().contentsAtPath(pathForDataFromBundle!)
		return dataFromBundle!
	}
   
}
