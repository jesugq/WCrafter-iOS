//
//  Selection.swift
//  WCrafter
//
//  Created by ITESM WCrafter Team on 05/04/18.
//  Copyright © 2018 WCrafter Team. All rights reserved.
//

import UIKit

class Selection : UIViewController {
    
    // UI Outlets
    @IBOutlet weak var welcome: UILabel!
    
    // Values obtained from Authentication ViewController
    var userText : String = ""
    
    // View Controller Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // The prepare for segue sets the string value of userText.
        welcome.text! = "Saludos \(userText)"
        
        // Attempt to find the values for the table.
        //self.hardcodedLoading()
        //self.performLoading()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
