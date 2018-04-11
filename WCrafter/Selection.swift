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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcome.text! = "Saludos \(userText)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
