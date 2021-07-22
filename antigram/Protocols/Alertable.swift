//
//  Alertable.swift
//  antigram
//
//  Created by Gabriel Puppi on 22/07/21.
//
import UIKit



protocol Alertable: AnyObject {
    
    func presentAlert(options: AlertOptions)
    
}

extension Alertable where Self: UIViewController {
    
    func presentAlert(options: AlertOptions) {
        
        let alert = UIAlertController(title: options.title, message: options.message, preferredStyle: options.style)
        
        
        for action in options.actions {
            
            alert.addAction(UIAlertAction(title: action.title, style: action.style, handler: action.handler))
            
        }
        
        self.present(alert, animated: true, completion: nil)
        
   }
    
}
