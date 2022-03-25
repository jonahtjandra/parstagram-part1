//
//  FeedViewController.swift
//  parstagram
//
//  Created by Jonah Tjandra on 3/25/22.
//

import UIKit
import Parse
import AlamofireImage

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var feed: UITableView!
    
    var posts =  [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feed.delegate = self
        feed.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let query = PFQuery(className: "Posts")
        query.includeKey("author")
        query.limit = 20
        
        query.findObjectsInBackground { posts, error in
            if (error != nil) {
                print("ERROR: \(error!)")
            } else {
                self.posts = posts!
                self.feed.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
        let user = post["author"] as! PFUser
        cell.username.text = user.username
        cell.caption.text = post["caption"] as? String
        
        let imageFile = post["post"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string: urlString)!
        cell.photo.af.setImage(withURL: url)
        
        return cell
    }

}
