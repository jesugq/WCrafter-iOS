import UIKit

class StatTableViewCell: UITableViewCell {
    
    // UI Outlets
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var value: UILabel!
    @IBOutlet weak var descr: UILabel!
    
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
    func addValues(photo: UIImage, value: String, descr: String){
        self.photo.image = photo
        self.value.text = value
        self.descr.text = descr
    }

}
