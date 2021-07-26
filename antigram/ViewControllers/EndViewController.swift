//
//  EndingViewController.swift
//  antigram
//
//  Created by Gabriel Puppi on 24/07/21.
//

import UIKit

class EndViewController: UIViewController {
    
    @IBOutlet weak var viewLabel: UILabel!
    @IBOutlet var backgroundView: UIView!
    @IBOutlet weak var doButtonRounded: UIButton!
    
    @IBOutlet weak var antoiLogo: UIImageView!
    weak var coordinator: AppCoordinatorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doButtonRounded.layer.cornerRadius = 10
        antoiLogo.rotate()
        
        overrideUserInterfaceStyle = .light
        
        // Do any additional setup after loading the view.
    }
   
    
    
    @IBAction func didPress(_ sender: UIButton) {
        
        self.coordinator?.presentLogIn()
        
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

extension UIView{
    func rotate() {
        let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = NSNumber(value: Double.pi * 2)
        rotation.duration = 3.5
        rotation.isCumulative = true
        rotation.repeatCount = Float.greatestFiniteMagnitude
        self.layer.add(rotation, forKey: "rotationAnimation")
    }
}
