//Class Passagener
//Count how many passenger are in the crafter

import UIKit
import MapKit

class Passenger: UIViewController, CLLocationManagerDelegate {
    //Outlets
    @IBOutlet weak var number: UILabel!
    //Atributtes
    var cont = 0
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    var manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        if manager.responds(to: #selector(CLLocationManager.requestWhenInUseAuthorization)){
            manager.requestWhenInUseAuthorization()
        }
        manager.startUpdatingLocation()
        let locValue: CLLocationCoordinate2D = (manager.location?.coordinate)!
        
        _ = ModelManager.instance.saveNumberPassenger(number: cont, lat: String(locValue.latitude), lon: String(locValue.longitude))
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
