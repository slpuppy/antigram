//
//  FeedTableViewCell.swift
//  antigram
//
//  Created by Gabriel Puppi on 21/07/21.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var headerUsernameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var mainPictureImageView: UIImageView!
    @IBOutlet weak var commentUsernameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var postDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(item: FeedItem) {
        
        profilePictureImageView.image = UIImage(named: item.profilePictureImageName)
        
        headerUsernameLabel.text = item.username
        locationLabel.text = item.postLocation
        mainPictureImageView.image = UIImage(named: item.postPictureImageName)
        commentUsernameLabel.text = item.username
        commentLabel.text = item.comment
        postDateLabel.text = item.postDate
        
    }

}
