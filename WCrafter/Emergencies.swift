import UIKit

class Emergencies: UIViewController {

    // Phone constants
    let FIREMEN = URL(string: "telprompt://2222322821")
    let SECURITY = URL(string: "telprompt://911")
    let AMBULANCE = URL(string: "telprompt://911")
    
    //
    // View Controller Functions
    //
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //
    // UI Actions
    //
    @IBAction func firemen(_ sender: Any) {
        self.makeCall(url: FIREMEN!)
    }
    @IBAction func security(_ sender: Any) {
        self.makeCall(url: SECURITY!)
    }
    @IBAction func ambulance(_ sender: Any) {
        self.makeCall(url: AMBULANCE!)
    }
    @IBAction func advanceTabbed(_ sender: Any) {
        performSegue(withIdentifier: "emergenciesToTabbed", sender: self)
    }
    
    
    //
    // Functions
    //
    func makeCall(url: URL) {
        // Command openURL is deprecated since iOS 10.
        if #available(iOS 10, *) {
            UIApplication.shared.open(url)
        } else {
            UIApplication.shared.openURL(url)
        }
    }

}
