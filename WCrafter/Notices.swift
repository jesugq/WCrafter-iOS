//
//  Notices.swift
//  WCrafter
//
//  Created by Alumno on 28/04/18.
//  Copyright © 2018 Alumno. All rights reserved.
//

import UIKit

class Notices: UIViewController {
    
    // Prepared Attributes
    var typeSent : String = ""
    var containerView : PostTableViewController = PostTableViewController()
    
    // UI Outlets
    @IBOutlet var segmented: UISegmentedControl!
    
    //
    // ViewController Functions
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        self.typeSelected(self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        containerView = segue.destination as! PostTableViewController
    }
    
    //
    // UI Actions
    //
    @IBAction func typeSelected(_ sender: Any) {
        defineType()
        containerView.typeGiven = typeSent
        containerView.updateType()
    }
    
    //
    // Functions
    //
    func defineType() {
        let option = segmented.selectedSegmentIndex
        typeSent = segmented.titleForSegment(at: option)!
    }
    
}
