//
//  AlertOptions.swift
//  antigram
//
//  Created by Gabriel Puppi on 22/07/21.
//

import Foundation


import UIKit

class AlertOptions {
 
    
    let title: String
    let message: String
    let style: UIAlertController.Style
    let actions: [AlertActionOption]
    
    internal init(title: String, message: String, style: UIAlertController.Style = .alert, actions: [AlertActionOption]) {
        self.title = title
        self.message = message
        self.style = style
        self.actions = actions
    }
    
}

class AlertActionOption {
  
    let title: String
    let style: UIAlertAction.Style
    let handler: ((UIAlertAction) -> Void)?

    
    internal init(title: String, style: UIAlertAction.Style = .default, handler: ((UIAlertAction) -> Void)? = nil) {
        self.title = title
        self.style = style
        self.handler = handler
    }
    
}
