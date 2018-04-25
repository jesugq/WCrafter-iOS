//
//  Crafter.swift
//  WCrafter
//
//  Created by Alumno on 23/04/18.
//  Copyright © 2018 Alumno. All rights reserved.
//

import Foundation

class Crafter {
    // Attributes
    var image : String
    var plate : String = ""
    
    // OoP Initialization
    init?(image: String, plate: String){
        // No image given.
        guard !image.isEmpty else {
            return nil
        }
        
        // No license plate given.
        guard !plate.isEmpty else {
            return nil
        }
        
        self.image = image
        self.plate = plate
    }
}
