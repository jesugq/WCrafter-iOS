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
    
    // Attributes
    var photoSent : UIImage = UIImage(named: "crafter1")!
    var plateSent : String = ""
    
    // Prepared Attributes
    var userGiven : String = ""
    
    // View Controller Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.greetings()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectToConfirm" {
            let newView = segue.destination as! Confirmation
            newView.photoGiven = photoSent
            newView.plateGiven = plateSent
        }
    }
    
    // Functions
    
    func receiveFromChild(photoSent: UIImage, plateSent: String) {
        self.photoSent = photoSent
        self.plateSent = plateSent
    }
    
    func advanceFromChild() {
        performSegue(withIdentifier: "selectToConfirm", sender: self)
    }
    
    func greetings() {
        welcome.text! = "Saludos \(userGiven)"
    }

}
