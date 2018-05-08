import Foundation

class Comment {
    
    // Attributes
    var user : String
    var comment : String
    
    var rating : Float
    
    // Construct
    init?(user: String, ratio : String, comment : String) {
        // No user given.
        guard !user.isEmpty else {
            return nil
        }
        
        // No ratio given.
        guard !ratio.isEmpty else {
            return nil
        }
        
        self.user = user
        self.rating = Float(ratio)!
        self.comment = comment
        
        // Rating is given as a non number.
        guard !rating.isNaN else {
            return nil
        }
        
        // Rating is outside of bounds.
        if rating<0 || rating>5 {
            return nil
        }
    }
    
}
