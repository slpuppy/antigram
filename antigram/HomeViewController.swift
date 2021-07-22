//
//  ViewController.swift
//  antigram
//
//  Created by Gabriel Puppi on 21/07/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var feedTableView: UITableView!
    
    let feed = [FeedItem(
                    profilePictureImageName: "profilePicture", postPictureImageName: "post01", username: "someone", postLocation: "somewhere", comment: "please don't comment on this photo", postDate: "Someday", postLiked: false),
                FeedItem(
                                profilePictureImageName: "profilePicture", postPictureImageName: "post01", username: "random brand", postLocation: "somewhere else", comment: "some ramdom quote", postDate: "Another day", postLiked: false),
                FeedItem(
                                profilePictureImageName: "profilePicture", postPictureImageName: "post01", username: "some user", postLocation: "someplace", comment: "i gotta get out of here", postDate: "Someday", postLiked: false)
    ]
    
    let stories = [StorieItem(profilePictureImageName: "profilePicture", username: "You?"),
                   StorieItem(profilePictureImageName: "profilePicture", username: "You?"),
                   StorieItem(profilePictureImageName: "profilePicture", username: "You?"),
                   StorieItem(profilePictureImageName: "profilePicture", username: "You?"),
                   StorieItem(profilePictureImageName: "profilePicture", username: "You?")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedTableView.dataSource = self
        feedTableView.register(UINib(nibName: "FeedTableViewCell", bundle: nil), forCellReuseIdentifier: "feedTableViewCell")
        // Do any additional setup after loading the view.
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
       
        return cell
        
    }
    
  
}
