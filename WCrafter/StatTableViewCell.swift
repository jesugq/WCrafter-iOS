//
//  StatTableViewCell.swift
//  WCrafter
//
//  Created by Alumno on 02/05/18.
//  Copyright © 2018 Alumno. All rights reserved.
//

import UIKit

class StatTableViewCell: UITableViewCell {
    
    // UI Outlets
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var value: UILabel!
    @IBOutlet weak var descr: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //
    // Functions
    //
    func addValues(photo: UIImage, value: String, descr: String){
        self.photo.image = photo
        self.value.text = value
        self.descr.text = descr
    }

}
