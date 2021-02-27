//
//  TweetCell.swift
//  Twitter
//
//  Created by Mikayla Orange on 2/26/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    @IBOutlet weak var displayName: UILabel!
    @IBOutlet weak var atName: UILabel!
    @IBOutlet weak var tweet: UILabel!
    @IBOutlet weak var profilePicture: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profilePicture.layer.masksToBounds = true
    	profilePicture.layer.cornerRadius = profilePicture.bounds.width / 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
