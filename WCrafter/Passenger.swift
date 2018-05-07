import UIKit

class Passenger: UIViewController {

    @IBOutlet weak var number: UILabel!
    //Atributtes
    var cont = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func more(_ sender: UITapGestureRecognizer) {
        if cont == 20{
            let alertController = UIAlertController(title: "Error", message:
                "No puedes llevar más de 20 pasajeros.", preferredStyle: UIAlertControllerStyle.alert)
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
