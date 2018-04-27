//
//  Crafter.swift
//  WCrafter
//
//  Created by Alumno on 23/04/18.
//  Copyright © 2018 Alumno. All rights reserved.
//

import Foundation
import UIKit

class Crafter {
   
    // Attributes
    var photo : UIImage
    var plate : String = ""
    
    // Image Constants
    let photo1 = UIImage(named: "crafter1")
    let photo2 = UIImage(named: "crafter2")
    let photo3 = UIImage(named: "crafter3")
    let photo4 = UIImage(named: "crafter4")
    let photo5 = UIImage(named: "crafter5")
    
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
    
    // Functions
    
    func createPhoto(image: String) -> UIImage {
        switch image {
        case "crafter1" :
            return photo1!
        case "crafter2" :
            return photo2!
        case "crafter3" :
            return photo3!
        case "crafter4" :
            return photo4!
        case "crafter5" :
            return photo5!
        default :
            return photo1!
        }
    }

}
