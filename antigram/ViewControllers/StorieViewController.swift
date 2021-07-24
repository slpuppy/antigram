//
//  StorieViewController.swift
//  antigram
//
//  Created by Gabriel Puppi on 24/07/21.
//

import UIKit

class StorieViewController: UIViewController {
    
    @IBOutlet weak var storieText: UILabel!
   
    var storieItem: StorieItem?

    override func viewDidLoad() {
        super.viewDidLoad()
        storieText.text = storieItem?.storieText

        // Do any additional setup after loading the view.
    }
    

    @IBAction func didPress(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
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
