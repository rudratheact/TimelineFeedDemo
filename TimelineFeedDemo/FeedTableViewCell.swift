//
//  FeedTableViewCell.swift
//  TimelineFeedDemo
//
//  Created by Rudra Misra on 10/28/21.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var postDate: UILabel!
    @IBOutlet weak var postDescription: UILabel!
    @IBOutlet weak var postMedia: UIImageView!
    
    @IBOutlet weak var like: UIImageView!
    @IBOutlet weak var lol: UIImageView!
    @IBOutlet weak var heart: UIImageView!
    @IBOutlet weak var totalInteractions: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
