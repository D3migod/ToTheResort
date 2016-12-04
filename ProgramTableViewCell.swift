//
//  ProgramTableViewCell.swift
//  ToTheResort
//
//  Created by Булат Галиев on 03.12.16.
//  Copyright © 2016 Булат Галиев. All rights reserved.
//

import UIKit

class ProgramTableViewCell: UITableViewCell {
    @IBOutlet weak var programTitleLabel: UILabel!

    @IBOutlet weak var programLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
