import UIKit

class ProfileViewController: UINavigationController {

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
        let newView = segue.destination as! Profile
        newView.userGiven = userGiven
    }

}
