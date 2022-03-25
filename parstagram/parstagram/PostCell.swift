//
//  PostCell.swift
//  parstagram
//
//  Created by Jonah Tjandra on 3/25/22.
//

import UIKit

class PostCell: UITableViewCell {
    
    
    @IBOutlet weak var username: UILabel!
    
    @IBOutlet weak var caption: UILabel!
    
    @IBOutlet weak var photo: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
