import UIKit

class TabbedViewController: UITabBarController {

    //
    // View Controller Functions
    //
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //
    // UI Actions
    //
    @IBAction func advanceEmergencies(_ sender: Any) {
        performSegue(withIdentifier: "tabbedToEmergencies", sender: self)
    }
    
    @IBAction func advanceProfile(_ sender: Any) {
        performSegue(withIdentifier: "tabbedToProfile", sender: self)
    }
    
}
