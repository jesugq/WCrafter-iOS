import UIKit

class CommentTableViewCell: UITableViewCell {
    
    // UI Outlets
    @IBOutlet weak var usernameRating: UILabel!
    @IBOutlet weak var comment: UILabel!
    
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
    func addValues(username: String, rating: Float, comment: String) {
        self.usernameRating.text = "\(username) : \(rating)"
        self.comment.text = comment
    }
    
}
