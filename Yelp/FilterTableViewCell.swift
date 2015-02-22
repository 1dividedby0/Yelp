//
//  FilterTableViewCell.swift
//  Yelp
//
//  Created by Dhruv Mangtani on 2/21/15.
//  Copyright (c) 2015 dhruv.mangtani. All rights reserved.
//

import UIKit

class FilterTableViewCell: UITableViewCell {

    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var indicatorSwitch: UISwitch!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
