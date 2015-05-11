//
//  MovieTableViewCell.swift
//  Movies
//
//  Created by Sunny Rochiramani on 5/10/15.
//  Copyright (c) 2015 Codepath. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    @IBOutlet weak var userReviewScoreIcon: UIImageView!
    @IBOutlet weak var userReviewScoreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        userReviewScoreIcon.setImageWithURL(NSURL(string: "http://d3biamo577v4eu.cloudfront.net/static/images/icons/popcorn_27x31.png"))
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
