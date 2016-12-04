//
//  PlainTourTableViewCell.swift
//  ToTheResort
//
//  Created by Булат Галиев on 30.11.16.
//  Copyright © 2016 Булат Галиев. All rights reserved.
//

import UIKit

class PlainTourTableViewCell: UITableViewCell {

    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var datesLabel: UILabel!
    @IBOutlet weak var tourNameLabel: UILabel!
    @IBOutlet weak var tourPriceLabel: UILabel!
    @IBOutlet weak var tourPictureImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
