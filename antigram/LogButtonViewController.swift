//
//  LogButtonViewController.swift
//  antigram
//
//  Created by Gabriel Puppi on 21/07/21.
//

import UIKit

class LogButtonViewController: UIViewController {
    

    @IBOutlet weak var doBttonRouded: UIButton!
    
          
    
override func viewDidLoad() {
        super.viewDidLoad()
        
    doBttonRouded.layer.cornerRadius = 10

    }
   

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
