import UIKit

class TabbedViewController: UITabBarController {

    // Prepared Attributes
    var userGiven : String = ""
    
    // UI Outlets
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var sosButton: UIButton!
    @IBOutlet weak var profileBar: UIBarButtonItem!
    @IBOutlet weak var sosBar: UIBarButtonItem!
    
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
        if segue.identifier == "tabbedToProfile" {
            let newView = segue.destination as! ProfileViewController
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
