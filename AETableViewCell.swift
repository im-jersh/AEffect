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
    weak var tableView : UITableView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        // remove disclosure indicator when entering edit mode
        if editing {
            self.accessoryType = .None
        } else { // add disclosure indicator
            self.accessoryType = .DisclosureIndicator
        }
    }
    
    // edit selection marker for for each cell to center marker in extra margin that is revealed when in editing mode
    override func didTransitionToState(state: UITableViewCellStateMask) {
        
        super.layoutSubviews()
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationBeginsFromCurrentState(false)
        UIView.setAnimationDuration(0.0)
        
        if let parentTableView = self.tableView as UITableView? {
            if parentTableView.editing {
                var contentFrame : CGRect = self.contentView.frame
                contentFrame.origin.x = 51.0
                self.contentView.frame = contentFrame
            }
        }

        
        UIView.commitAnimations()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let parentTableView = self.tableView as UITableView? {
            if parentTableView.editing {
                var contentFrame : CGRect = self.contentView.frame
                contentFrame.origin.x = 51.0
                self.contentView.frame = contentFrame
            }
        }
    }


}
