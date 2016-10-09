//
//  DestinationTableViewCell.swift
//  Detroit-School-Transport
//
//  Created by John Yang on 10/9/16.
//  Copyright © 2016 John Yang. All rights reserved.
//

import UIKit

class DestinationTableViewCell: UITableViewCell {

    @IBOutlet weak var numberBackgroundView: UIView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var fromLabel: UILabel!
    @IBOutlet weak var toLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
