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
        NotificationCenter.default.addObserver(self, selector: #selector(ChangePassword.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ChangePassword.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        self.fillSwitches()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height * 0.75
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height * 0.75
            }
        }
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
