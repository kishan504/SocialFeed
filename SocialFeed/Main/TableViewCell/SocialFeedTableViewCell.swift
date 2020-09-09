//
//  SocailFeedTableViewCell.swift
//  SocialFeed
//
//  Created by administrator on 07/09/2020.
//  Copyright © 2020 kishan. All rights reserved.
//

import UIKit

class SocialFeedTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var descriptionData: UILabel!
    @IBOutlet weak var imageViewData: UIImageView!
    
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
