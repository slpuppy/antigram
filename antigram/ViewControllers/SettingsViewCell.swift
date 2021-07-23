//
//  SettingsViewCell.swift
//  antigram
//
//  Created by Gabriel Puppi on 22/07/21.
//

import UIKit

class SettingsViewCell: UITableViewCell {
    
    weak var coordinator: AppCoordinatorDelegate?
    weak var alertable: Alertable?

    @IBOutlet weak var deleteButton: UIButton!
    
    @IBOutlet weak var buttonImage: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    
    
    
    
    
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func setup(item: ConfigItem) {
        
        deleteButton.setTitle(item.buttonLabel, for: .normal)
        buttonImage.image = UIImage(systemName: item.imageName)
        
    }
    
    
}

