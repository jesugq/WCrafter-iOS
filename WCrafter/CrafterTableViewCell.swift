//
//  CrafterTableViewCell.swift
//  WCrafter
//
//  Created by Alumno on 23/04/18.
//  Copyright © 2018 Alumno. All rights reserved.
//

import UIKit

class CrafterTableViewCell: UITableViewCell {
    
    // UI Outlets
    @IBOutlet var photo: UIImageView!
    @IBOutlet var plate: UILabel!
    
    // ViewController functions
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
