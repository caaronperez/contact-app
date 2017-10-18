//
//  TableViewCellController.swift
//  HW-DAY8E4
//
//  Created by MCS Devices on 10/16/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import UIKit

class TableViewCellController: UITableViewCell {

    
    
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
