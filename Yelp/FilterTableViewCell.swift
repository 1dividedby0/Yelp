//
//  FilterTableViewCell.swift
//  Yelp
//
//  Created by Dhruv Mangtani on 2/21/15.
//  Copyright (c) 2015 dhruv.mangtani. All rights reserved.
//

import UIKit

protocol FilterViewCellDelegate : class{
    func filterView(filterCell: FilterTableViewCell, didChangeSwitchValue value: Bool)
}
class FilterTableViewCell: UITableViewCell {

    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var indicatorSwitch: UISwitch!
    
    weak var delegate:FilterViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func switchDidChangeAction(sender: AnyObject) {
        delegate?.filterView(self, didChangeSwitchValue: indicatorSwitch.on)
    }

}
