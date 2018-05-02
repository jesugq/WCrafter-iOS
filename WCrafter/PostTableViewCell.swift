//
//  PostTableViewCell.swift
//  WCrafter
//


import UIKit

class PostTableViewCell: UITableViewCell {

    // UI Outlets
    @IBOutlet var desc: UILabel!
    @IBOutlet var code: UILabel!
    
    //
    // View Controller Functions
    //
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //
    // Functions
    //
    func addValues(desc: String, code: String) {
        self.desc.text = desc
        self.code.text = code
    }
}
