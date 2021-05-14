//
//  TableViewCell.swift
//  DropBearApp
//
//  Created by Ian Keen on 2019-05-07.
//  Copyright © 2019 Mustard. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet private(set) var label: UILabel!
    @IBOutlet private(set) var `switch`: UISwitch!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        self.switch.isOn = selected
    }
}
