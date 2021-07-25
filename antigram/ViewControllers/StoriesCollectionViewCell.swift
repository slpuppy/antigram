//
//  StoriesCollectionViewCell.swift
//  antigram
//
//  Created by Gabriel Puppi on 21/07/21.
//

import UIKit

class StoriesCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var username: UILabel!
    
 
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        // Initialization code
    }
    
    func setup(item: StorieItem) {
        
        
        
        userImage.image = UIImage(named: item.profilePictureImageName)
        
        username.text = item.username
        
        
        
    }
    

}
