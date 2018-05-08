import UIKit

class Passenger: UIViewController {

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
        if cont == 20{
            let alertController = UIAlertController(title: "Error", message:
                "No puedes llevar más de 20 pasajeros.", preferredStyle: UIAlertControllerStyle.alert)
            let action = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        } else {
            cont+=1
            number.text = "\(cont)"
        }
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
