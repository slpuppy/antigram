//
//  File.swift
//  antigram
//
//  Created by Gabriel Puppi on 21/07/21.
//

import Foundation



class FeedItem {
    
    let profilePictureImageName: String
    let postPictureImageName: String
    let username: String
    let postLocation: String
    let comment: String
    let postDate: String
    let postLiked: Bool
    
    init(profilePictureImageName: String, postPictureImageName: String, username: String, postLocation: String, comment: String, postDate: String, postLiked: Bool) {
          self.profilePictureImageName = profilePictureImageName
          self.postPictureImageName = postPictureImageName
          self.username = username
          self.postLocation = postLocation
          self.comment = comment
          self.postDate = postDate
          self.postLiked = postLiked
      }
    
}
