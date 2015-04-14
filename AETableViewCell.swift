//
//  AETableViewCell.swift
//  Æffect
//
//  Created by Joshua O'Steen on 3/20/15.
//  Copyright (c) 2015 Josh O'Steen. All rights reserved.
//

import UIKit

class AETableViewCell: UITableViewCell {

    @IBOutlet weak var emotionColor: UIView!
    @IBOutlet weak var featuredImage: UIImageView!
    @IBOutlet weak var headline: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var pubDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
