//Class Passagener
//Count how many passenger are in the crafter

import UIKit
import MapKit

class Passenger: UIViewController, CLLocationManagerDelegate {
    //Outlets
    @IBOutlet weak var number: UILabel!
    //Atributtes
    var cont = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
            }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func more(_ sender: UITapGestureRecognizer) {
        cont+=1
        number.text = "\(cont)"
    }
    
    @IBAction func less(_ sender: UITapGestureRecognizer) {
        if cont == 0 {
            number.text = "\(cont)"
        } else {
            cont-=1
            number.text = "\(cont)"
        }
    }
}
