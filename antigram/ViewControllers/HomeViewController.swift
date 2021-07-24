//
//  ViewController.swift
//  antigram
//
//  Created by Gabriel Puppi on 21/07/21.
//

import UIKit

class HomeViewController: UIViewController, Alertable {
    
    weak var coordinator: AppCoordinatorDelegate?
    
    @IBOutlet weak var feedTableView: UITableView!
    
    @IBOutlet weak var storiesColletionView: UICollectionView!
    
    var refreshControl: UIRefreshControl!
    var refreshEvent = 0
    var inboxEvent = 0
    
    
   
    @IBOutlet weak var inboxButton: UIButton!
    
    
    
    let feed = [FeedItem(
                    profilePictureImageName: "profilePicture", postPictureImageName: "you", username: "your account", postLocation: "top of the feed", comment: "What's antigram about?", postDate: "Just now", postLiked: false),
                FeedItem(
                    profilePictureImageName: "profilePicture", postPictureImageName: "post01", username: "random user", postLocation: "somewhere", comment: "don't comment on the photos", postDate: "Someday", postLiked: false),
                FeedItem(
                    profilePictureImageName: "profilePicture", postPictureImageName: "product", username: "random brand", postLocation: "The market", comment: "We bought you, now you buy us!", postDate: "Another day", postLiked: false),
                FeedItem(
                    profilePictureImageName: "profilePicture", postPictureImageName: "yanabaya", username: "antigramer", postLocation: "from out of here", comment: "Time to start figuring out what to do", postDate: "Long time ago", postLiked: false)
    ]
    
    let stories = [StorieItem(profilePictureImageName: "storythumb1", username: "You?", storieText: "Do you know who you are?"),
                   StorieItem(profilePictureImageName: "storythumb1", username: "some artist", storieText: "literally a black rectangle with a X in the up right corner."),
                   StorieItem(profilePictureImageName: "storythumb1", username: "that person", storieText: "you're only here to feed my ego."),
                   StorieItem(profilePictureImageName: "storythumb1", username: "some brand", storieText: "social media is a marketplace tha trades in humans."),
                   StorieItem(profilePictureImageName: "storythumb1", username: "antigramer", storieText: "storie 5")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        
        feedTableView.dataSource = self
        feedTableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "feedTableViewCell")
        storiesColletionView.delegate = self
        storiesColletionView.dataSource = self
        storiesColletionView.register(UINib(nibName: "StoriesCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "storieCollectionViewCell")
        
        refreshControl = UIRefreshControl()
        feedTableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshControlTrigger(_:)), for: .valueChanged)
        inboxButton.tintColor = UIColor.black
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
         
        
        self.coordinator?.sync(state: .home)
    
    }
    
    @IBAction func cameraDidPress(_ sender: UIButton) {
        
        self.presentAlert(options: AlertOptions(title: "Something went wrong",
                                                message: "It looks like you've already reached your limit of 01 post per account.",
                                                actions: [AlertActionOption(title: "Cancel"),
                                                          AlertActionOption(title: "Go back")]))
        
    }
    
    @IBAction func inboxDidPress(_ sender: UIButton) {
    
        switch self.inboxEvent {
        
        case 0:
            self.presentAlert(options: AlertOptions(title: "Not important DM's", message: "Ok I'll help you a little bit and remove this annoying red dot, but don't click here again ok?", actions: [
                                                        AlertActionOption(title: "Don't need help", style: .destructive),
                                                        AlertActionOption(title: "Thanks", style: .default, handler: { _ in
                                                                          
                                                            self.inboxButton.setImage(UIImage(systemName: "tray", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24)), for: .normal)
                                                            self.inboxEvent += 1
                                                                      })]))
        case 1:
            self.presentAlert(options: AlertOptions(title: "I'm trying to help you!", message: "Looks like my help wasn't enought for you to keep your finger out of here, let's try again.", actions: [
                                                        AlertActionOption(title: "Ok", style: .default),
                                                        AlertActionOption(title: "Try what?", style: .destructive, handler: { _ in
                                                            
                                                            self.inboxButton.tintColor = UIColor.lightGray
                                                            self.inboxButton.setImage(UIImage(systemName: "tray", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24)), for: .normal)
                                                            self.inboxEvent += 1
                                                                      })]))
        case 2:
            self.presentAlert(options: AlertOptions(title: "You're tapping a disabled button!", message: "Please consider never tapping this button again.", actions: [
                                                        AlertActionOption(title: "Won't press it again", style: .default),
                                                        AlertActionOption(title: "Dare me", style: .destructive, handler: { _ in
                                                            self.inboxButton.tintColor = UIColor.white
                                                            self.inboxButton.setImage(UIImage(systemName: "tray", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24)), for: .normal)
                                                            self.inboxEvent += 1
                                                                      })]))
        default:
            self.presentAlert(options: AlertOptions(title: "You are having allucinations!", message: "Please deactivate your account now", actions: [
                                                        AlertActionOption(title: "No.", style: .destructive),
                                                        AlertActionOption(title: "Go to settings", style: .default, handler: { _ in
                                                           
                                                            self.coordinator?.presentSettings()
                                                           
                                                                      })]))
      }
 }
    
    
    
    @objc func refreshControlTrigger(_ sender: Any) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
           switch self.refreshEvent {
            case 0:
                self.refreshControl.endRefreshing()
                self.refreshEvent += 1
                self.presentAlert(options: AlertOptions(
                                    title: "Stop Refreshing!",
                                    message: "Refreshing is a highly addictive behaviour and may cause health issues.",
                                    actions: [AlertActionOption(title: "Let me refresh", style: .destructive),
                                              AlertActionOption(title: "Ok")]))
                
            case 1:
                self.refreshControl.endRefreshing()
                self.refreshEvent += 1
                self.presentAlert(options: AlertOptions(
                                    title: "Refresh addiction warning!",
                                    message: "You're becoming an addict, if the symptoms persist please take a break from the app.",
                                    actions: [AlertActionOption(title: "Keep using", style: .destructive),
                                              AlertActionOption(title: "OK")]))
            case 2:
                self.refreshControl.endRefreshing()
                self.refreshEvent += 1
                self.presentAlert(options: AlertOptions(
                                    title: "You've become addicted to refreshing!",
                                    message: "Maybe you should deactivate your account for a while.",
                                    actions: [AlertActionOption(title: "Nope, I'm OK", style: .destructive),
                                              AlertActionOption(title: "I'll consider it")]))
            default:
                self.refreshControl.endRefreshing()
                self.presentAlert(options: AlertOptions(
                                    title: "You are addicted to refreshing!",
                                    message: "Delete or deactivate your account for a while.",
                                    actions: [AlertActionOption(title: "Keep Using", style: .destructive),
                                              AlertActionOption(title: "Go to settings", handler: { _ in
                                             
                                                self.coordinator?.presentSettings()
                                               
                                                          })]))
           }
            
        }
        
    }
    
    
}

extension HomeViewController: UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        feed.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "feedTableViewCell") as? FeedTableViewCell else {
            
            fatalError()
        }
        
        cell.setup(item: feed[indexPath.row])
        cell.alertable = self
        
        return cell
        
    }
}

extension HomeViewController: UICollectionViewDataSource  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        stories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "storieCollectionViewCell", for: indexPath) as? StoriesCollectionViewCell else {
            
            fatalError()
        }
        
        cell.setup(item: stories[indexPath.item])
        
        
        return cell
    }
    
}

extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        coordinator?.presentStorie(item: stories[indexPath.item])
        
        
}
    
    
}
