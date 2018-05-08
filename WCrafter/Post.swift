import UIKit

class Post {
    
    // Attributes
    var desc : String
    var code : String
    
    // Constructor
    init?(desc: String, code: String){
        // No description given.
        guard !desc.isEmpty else {
            return nil
        }
        
        // No code given.
        guard !code.isEmpty else {
            return nil
        }
        
        self.desc = desc
        self.code = code
    }

}
