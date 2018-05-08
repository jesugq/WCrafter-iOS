import UIKit

class Confirmation: UIViewController {

    // UI Outlets
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var plate: UILabel!
    
    // Prepared Attributes
    var photoGiven : UIImage = UIImage(named: "crafter1")!
    var plateGiven : String = ""
    var userGiven : String = ""
    
    //
    // View Controller Functions
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presentCrafter()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newView = segue.destination as! ToppedViewController
        newView.userGiven = self.userGiven
    }
    
    //
    // UI Actions
    //
    @IBAction func confirm(_ sender: Any) {
        performSegue(withIdentifier: "confirmToRoutes", sender: self)
    }
    
    //
    // Functions
    //
    func presentCrafter() {
        photo.image = photoGiven
        plate.text = plateGiven
    }

}
