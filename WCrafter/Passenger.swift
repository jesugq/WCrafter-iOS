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
        if !canIncrease() {
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
        if !canDecrease() {
            number.text = "\(cont)"
        } else {
            cont-=1
            number.text = "\(cont)"
        }
    }
    
    func canIncrease() -> Bool {
        return cont < 20
    }
    
    func canDecrease() -> Bool {
        return cont > 0
    }
}
