//
//  StorieItem.swift
//  antigram
//
//  Created by Gabriel Puppi on 21/07/21.
//

import Foundation

class StorieItem {
    
    let profilePictureImageName: String
    let username: String
    let storieText: String
    var storieClicked: Bool
   
    
    init(profilePictureImageName: String, username: String, storieText: String, storieClicked: Bool) {
          self.profilePictureImageName = profilePictureImageName
          self.username = username
         self.storieText = storieText
        self.storieClicked = storieClicked
         
      }
    
}

