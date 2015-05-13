//
//  Episode.swift
//  StarTrek
//
//  Created by Tyten Teegarden on 4/23/15.
//  Copyright (c) 2015 Tyten llc. All rights reserved.
//

import UIKit

class Episode: NSObject, NSCoding {

	var disliked = false
	var title = "Untitled"
	var episode = 0
	var season = 0
	var synopsis = "No synopsis found"


	// Never call yourself
	required convenience init(coder decoder: NSCoder) {
		self.init()
		self.disliked = decoder.decodeBoolForKey("disliked")
		self.title = decoder.decodeObjectForKey("title") as! String
		self.episode = decoder.decodeIntegerForKey("episode")
		self.season = decoder.decodeIntegerForKey("season")
		self.synopsis = decoder.decodeObjectForKey("synopsis") as! String
	}

	// Never call yourself
	func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeBool(disliked, forKey: "disliked")
		aCoder.encodeObject(title, forKey: "title")
		aCoder.encodeInteger(episode, forKey: "episode")
		aCoder.encodeInteger(season, forKey: "season")
		aCoder.encodeObject(synopsis, forKey: "synopsis")
	}
   
}
