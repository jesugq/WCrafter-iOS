//
//  Confirmation.swift
//  WCrafter
//
//  Created by Alumno on 25/04/18.
//  Copyright © 2018 Alumno. All rights reserved.
//

import UIKit

class Confirmation: UIViewController {

    // UI Outlets
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var plate: UILabel!
    
    
    // Prepared Attributes
    var photoGiven : UIImage = UIImage(named: "crafter1")!
    var plateGiven : String = ""
    
    // View Controller Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presentCrafter()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // UI Actions

    @IBAction func confirm(_ sender: Any) {
        performSegue(withIdentifier: "confirmToRoutes", sender: self)
    }
    
    // Functions
    
    func presentCrafter() {
        photo.image = photoGiven
        plate.text = plateGiven
    }

}
