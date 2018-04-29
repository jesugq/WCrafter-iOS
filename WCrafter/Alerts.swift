import UIKit

class Alerts: UIViewController {

    // UI Outlets
    @IBOutlet weak var accident: UISwitch!
    @IBOutlet weak var obstruction: UISwitch!
    @IBOutlet weak var delayed: UISwitch!
    @IBOutlet weak var other: UISwitch!
    @IBOutlet weak var comment: UITextField!
    
    // Attributes
    var switches : [UISwitch] = [UISwitch]()
    var lastSelection : Int = -1
    var queryType : String = ""
    
    //
    // View Controller Functions
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fillSwitches()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //
    // UI Actions
    //
    @IBAction func accidentSelected(_ sender: Any) {
        lastSelection = 0
        queryType = "accident"
        self.deselectSwitches()
    }
    @IBAction func obstructionSelected(_ sender: Any) {
        lastSelection = 1
        queryType = "obstruction"
        self.deselectSwitches()
    }
    @IBAction func delaySelected(_ sender: Any) {
        lastSelection = 2
        queryType = "delay"
        self.deselectSwitches()
    }
    @IBAction func otherSelected(_ sender: Any) {
        lastSelection = 3
        queryType = "other"
        self.deselectSwitches()
    }
    
    @IBAction func reportAlert(_ sender: Any) {
        if self.checkEmpty() {
            printAlert(title: "Tipo no seleccionado.", message: "Seleccione una categoría de los disponibles.")
            return
        }
        printAlert(title: "Su alerta ha sido envíada.", message: "Recibirá instrucciones pronto.")
    }
    
    //
    // Functions
    //
    func fillSwitches() {
        switches += [accident, obstruction, delayed, other]
    }
    
    func deselectSwitches() {
        for index in 0...(switches.count-1) {
            if (index != lastSelection) {
                switches[index].setOn(false, animated: true)
            }
        }
    }
    
    func printAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    func checkEmpty() -> Bool {
        for index in 0...(switches.count-1) {
            if switches[index].isOn {
                return false
            }
        }
        return true
    }
    
}
