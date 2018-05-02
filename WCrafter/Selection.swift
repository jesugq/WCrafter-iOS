import UIKit

class Selection : UIViewController {
    
    // UI Outlets
    @IBOutlet weak var welcome: UILabel!
    
    // Prepared Attributes
    var photoSent : UIImage = UIImage(named: "crafter1")!
    var plateSent : String = ""
    
    var userGiven : String = ""
    
    //
    // View Controller Functions
    //
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
            newView.userGiven = self.userGiven
        }
        
        if segue.identifier == "selectToContainer" {
            let containerView = segue.destination as! CrafterTableViewController
            containerView.parentView = self
        }
    }
    
    //
    // Functions
    //
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
