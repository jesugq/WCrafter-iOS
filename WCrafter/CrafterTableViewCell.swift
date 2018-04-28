import UIKit

class CrafterTableViewCell: UITableViewCell {
    
    // UI Outlets
    @IBOutlet var photo: UIImageView!
    @IBOutlet var plate: UILabel!
    
    //
    // ViewController functions
    //
    override func awakeFromNib() {
        super.awakeFromNib()
        //photo.contentMode = .scaleAspectFit
        //photo.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //
    // Functions
    //
    func addValues(photo: UIImage, plate: String) {
        self.photo.image = photo
        self.plate.text = plate
    }

}
