//
//  ConfigViewController.swift
//  antigram
//
//  Created by Gabriel Puppi on 22/07/21.
//

import UIKit

class ConfigViewController: UIViewController, Alertable {
    
    weak var coordinator: AppCoordinatorDelegate?
    
  
    @IBOutlet weak var settingsTableView: UITableView!
    
    let settings = [ConfigItem(imageName: "map", buttonLabel: "Hints"),
                    ConfigItem(imageName: "xmark.circle", buttonLabel: "Log out"),
                    ConfigItem(imageName: "trash", buttonLabel: "Delete account")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
       settingsTableView.dataSource = self
        settingsTableView.register(UINib(nibName: "SettingsViewCell", bundle: nil), forCellReuseIdentifier: "settingsTableViewCell")

        // Do any additional setup after loading the view.
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
extension ConfigViewController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settings.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "settingsTableViewCell") as? SettingsViewCell else {
            
            fatalError()
        }
        
        cell.setup(item: settings[indexPath.row])
        cell.alertable = self
        
        return cell
        
    }
    
    
    
}
