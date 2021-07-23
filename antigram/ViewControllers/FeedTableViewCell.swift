//
//  FeedTableViewCell.swift
//  antigram
//
//  Created by Gabriel Puppi on 21/07/21.
//

import UIKit

class FeedTableViewCell: UITableViewCell {
    
    weak var alertable: Alertable?
    
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var headerUsernameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var mainPictureImageView: UIImageView!
    @IBOutlet weak var commentUsernameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var postDateLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    var liked = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    @IBAction func optionsDidPress(_ sender: UIButton) {
    
        
        alertable?.presentAlert(options: AlertOptions(
                                    title: "Running out of options?",
                                    message: "Maybe the only option is to get out of here.",
                                    actions: [AlertActionOption(title: "I won't", style: .destructive),
                                              AlertActionOption(title: "I'll try")]))
    
    }
    @IBAction func commentDidPress(_ sender: UIButton) {
        
        alertable?.presentAlert(options: AlertOptions(
                                    title: "Please, no comments",
                                    message: "We're trying to make a revolution here, a little help could be useful.",
                                    actions: [AlertActionOption(title: "Say nothing"),
                                              AlertActionOption(title: "I understand")]))
    }
    
    
    
    
    
    @IBAction func likeDidPress(_ sender: UIButton) {
        
        
        
        if liked == false {
            
            alertable?.presentAlert(options: AlertOptions(
                                        title: "Did you REALLY liked it?",
                                        message: "Do you even know why you've been tapping hearts this time?",
                                        actions: [
                                            AlertActionOption(title: "Don't like"),
                                            AlertActionOption(title: "Whatever",style: .destructive, handler: { _ in
                                                
                                                self.likeButton.setImage(UIImage(systemName: "heart.slash"), for: .normal)
                                                self.liked = true
                                                
                                            })
                                        ]))
            
            
        }
        
        alertable?.presentAlert(options: AlertOptions(
                                    title: "Stop clicking this button without a purpose!",
                                    message: "Ego shots can be as addictive as nicotine!",
                                    actions: [
                                        AlertActionOption(title: "You're overreacting", style: .destructive),
                                        AlertActionOption(title: "I'll keep that in mind")
                                    ]))
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
