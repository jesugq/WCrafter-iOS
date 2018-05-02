//
//  ToppedViewController.swift
//  WCrafter
//
//  Created by Alumno on 02/05/18.
//  Copyright © 2018 Alumno. All rights reserved.
//

import UIKit

class ToppedViewController: UINavigationController {
    
    // Prepared Attributes
    var userGiven : String = ""

    //
    // View Controller Functions
    //
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newView = segue.destination as! TabbedViewController
        newView.userGiven = self.userGiven
    }

}
