import Foundation
import UIKit

class Crafter {
   
    // Attributes
    var photo : UIImage
    var plate : String = ""
    
    // Constructor
    init?(image: String, plate: String){
        // No image given.
        guard !image.isEmpty else {
            return nil
        }
        
        // No license plate given.
        guard !plate.isEmpty else {
            return nil
        }
        
        self.photo = UIImage(named: "crafter1")!
        self.plate = plate
        
        self.photo = self.createPhoto(image: image)
    }
    
    //
    // Functions
    //
    func createPhoto(image: String) -> UIImage {
        switch image {
        case "crafter1" :
            return UIImage(named: "crafter1")!
        case "crafter2" :
            return UIImage(named: "crafter2")!
        case "crafter3" :
            return UIImage(named: "crafter3")!
        case "crafter4" :
            return UIImage(named: "crafter4")!
        case "crafter5" :
            return UIImage(named: "crafter5")!
        default :
            return UIImage(named: "crafter1")!
        }
    }

}
