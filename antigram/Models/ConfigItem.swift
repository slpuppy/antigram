//
//  ConfigItem.swift
//  antigram
//
//  Created by Gabriel Puppi on 22/07/21.
//

import Foundation


class ConfigItem {
   
    
    let imageName: String
    let buttonLabel: String
    
    internal init(imageName: String, buttonLabel: String) {
        self.imageName = imageName
        self.buttonLabel = buttonLabel
    }
    
}
