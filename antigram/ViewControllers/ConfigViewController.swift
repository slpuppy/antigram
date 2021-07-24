//
//  ConfigViewController.swift
//  antigram
//
//  Created by Gabriel Puppi on 22/07/21.
//

import UIKit

class ConfigViewController: UIViewController, Alertable, UITableViewDelegate {
    
    weak var coordinator: AppCoordinatorDelegate?
    var termsAccepted = false
    
    
    @IBOutlet weak var settingsTableView: UITableView!
    
    let settings = [ConfigItem(imageName: "person.crop.circle.badge.plus", buttonLabel: "Find friends"),
                    ConfigItem(imageName: "hand.raised", buttonLabel: "Block Ads"),
                    ConfigItem(imageName: "lock", buttonLabel: "Privacy"),
                    ConfigItem(imageName: "shield", buttonLabel: "Security"),
                    ConfigItem(imageName: "xmark.circle", buttonLabel: "Log out"),
                    ConfigItem(imageName: "trash", buttonLabel: "Delete account"),
                    ConfigItem(imageName: "a.square.fill", buttonLabel: "Be an antigramer!"),
                    ConfigItem(imageName: "list.dash", buttonLabel: "Terms and conditions"),
                    ConfigItem(imageName: "info.circle", buttonLabel: "About")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        settingsTableView.dataSource = self
        settingsTableView.register(UINib(nibName: "SettingsViewCell", bundle: nil), forCellReuseIdentifier: "settingsTableViewCell")
        settingsTableView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        self.coordinator?.sync(state: .settings)
        
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        switch indexPath.row {
        
        case 0:
            self.presentAlert(options: AlertOptions(title: "Your friends aren't here.", message: "The collections of data located cannot be considered friends.", actions: [AlertActionOption(title: "Cancel"),
                 AlertActionOption(title: "Ok")]))
            
        case 1:
            self.presentAlert(options: AlertOptions(
                                title: "No hiding from the algs!",
                                message: "You can't really prevent from being manipulated by the market here.",
                                actions: [AlertActionOption(title: "I don't care!", style: .destructive),
                                          AlertActionOption(title: "Get out!", style: .default)]))
            
        case 2:
            self.presentAlert(options: AlertOptions(
                                title: "No real privacy available!",
                                message: "There is no guarantee that your data will not be tracked and shared with others.",
                                actions: [AlertActionOption(title: "Accept.", style: .destructive),
                                          AlertActionOption(title: "Accept.", style: .destructive)]))
            
        case 3:
            self.presentAlert(options: AlertOptions(
                                title: "Warning, this product may cause addiction!",
                                message: "For your own security deactivate your account for a while after prolongated use.",
                                actions: [AlertActionOption(title: "Ok."),
                                          AlertActionOption(title: "I'm fine")]))
            
        case 4:
            self.presentAlert(options: AlertOptions(
                                title: "Wrong way!",
                                message: "There is no exit through here, search elsewhere.",
                                actions: [AlertActionOption(title: "Ok."),
                                          AlertActionOption(title: "Go back!")]))
            
        case 5:
            if self.termsAccepted == false {
                
                self.presentAlert(options: AlertOptions(
                                    title: "You aren't an antigramer yet!",
                                    message: "For being able to delete your account first you need to accept the terms of becoming an antigramer",
                                    actions: [AlertActionOption(title: "Cancel.", style: .destructive),
                                              AlertActionOption(title: "I will.")]))
                } else {
                
                self.presentAlert(options: AlertOptions(
                                    title: "Are you ready?",
                                    message: "Just continue if you think you're ready to become an antigramer",
                                    actions: [AlertActionOption(title: "Cancel", style: .destructive),
                                              AlertActionOption(title: "Delete", handler: { _ in
                                                
                                                self.coordinator?.presentEnding()
                                               
                                                          })]))
                
                
                }
            
        case 6:
           
            if self.termsAccepted == false { self.presentAlert(options: AlertOptions(
                                
                                title: "Join the revolution!",
                                message: "You're more than welcome, but first you need to read and accept our Terms and Conditions.",
                                actions: [AlertActionOption(title: "Cancel.", style: .destructive),
                                          AlertActionOption(title: "Ok")]))
            } else {
                
                self.presentAlert(options: AlertOptions(
                                    title: "We're waiting you outside!",
                                    message: "Seems you've already accepted the terms for becoming an antigramer, now there just one little step left.",
                                    actions: [AlertActionOption(title: "Cancel", style: .destructive),
                                              AlertActionOption(title: "Ok")]))
                 }
            
        case 7:
            if self.termsAccepted == false {
                
                    self.presentAlert(options: AlertOptions(
                                title: "Terms of antigram!",
                                message: "By accepting this term you swear to rethink critically your use of all social media and share the message to people you know.",
                                actions: [AlertActionOption(title: "Cancel", style: .destructive),
                                          AlertActionOption(title: "Accept", handler: { _ in
                                           
                                                                self.termsAccepted = true })]))
            } else {
                self.presentAlert(options: AlertOptions(
                            title: "Terms of antigram!",
                            message: "Rethink critically your use of all social media and share the message to people you know.",
                            actions: [AlertActionOption(title: "Close"),
                                      AlertActionOption(title: "Ok")]))
                
            }
            
        case 8:
            self.presentAlert(options: AlertOptions(
                                title: "Developed by sleepy puppy.",
                                message: "See other projects on thesleepypuppy.com or github.com/slpuppy",
                                actions: [AlertActionOption(title: "Ok"),
                                          AlertActionOption(title: "Cool")]))
            
        default:
            break
            
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
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
