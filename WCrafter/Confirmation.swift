//
//  Confirmation.swift
//  WCrafter
//
//  Created by Alumno on 25/04/18.
//  Copyright © 2018 Alumno. All rights reserved.
//

import UIKit

class Confirmation: UIViewController {

    // View Controller Functions
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Nada
    }
    
    // UI Actions
    @IBAction func confirm(_ sender: Any) {
        performSegue(withIdentifier: "confirmToRoutes", sender: self)
    }

}
