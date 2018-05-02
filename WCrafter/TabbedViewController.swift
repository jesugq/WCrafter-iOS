import UIKit

class TabbedViewController: UITabBarController {

    // Prepared Attributes
    var userGiven : String = ""
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tabbedToProfile" {
            let newView = segue.destination as! Profile
            newView.userGiven = self.userGiven
        }
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
