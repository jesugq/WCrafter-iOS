//
//  ChangePassword.swift
//  WCrafter
//  Class for change the password
import UIKit

class ChangePassword: UIViewController {
    // Outlets
    @IBOutlet weak var cuur: UITextField!
    @IBOutlet weak var newPassword: UITextField!
    @IBOutlet weak var newPassword2: UITextField!
    @IBOutlet weak var button: UIButton!
    //Atributes
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    //Check if the text field has somenthing for enable the button
    func enableButton(){
        //Check if it is empty
        if cuur.text!.isEmpty || newPassword.text!.isEmpty || newPassword2.text!.isEmpty {
            button.isEnabled = false
        } else {
            button.isEnabled = true
        }
    }
    
    
    @IBAction func savePassword(_ sender: Any) {
        // Check if the two new passwords are the same
        if newPassword.text != newPassword2.text{
            //If not, it asks again
            let alertController = UIAlertController(title: "No same password", message:
                "Las contraseñas no coinciden.", preferredStyle: UIAlertControllerStyle.alert)
            let action = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        } else{
            // Prevents multiple data task sessions.
            if dataTask != nil {
                dataTask?.cancel()
            }
            
            //Save in data base
            let alertController = UIAlertController(title: "Correct", message:
                "Contraseña guardada", preferredStyle: UIAlertControllerStyle.alert)
            let action = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
            
            //Convert the characters to php compatible format
            let password = newPassword.text!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            //Here we can send the ID of the user
            let userEntry = newPassword.text!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            
            // Temporary login website. This will be changed to VW's official url.
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            let url = NSURL(string: "http://www.iroseapps.com/moviles/login.php?username=\(userEntry)&password=\(password)")
            
            // Request information from an URL with a Data Task, calling function verifyResult() if successful.
            let request = URLRequest(url: url! as URL)
            dataTask = defaultSession.dataTask(with: request){
                data, response, error in DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
                
                if let error = error {
                    print(error.localizedDescription)
                } else if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200 {
                        DispatchQueue.main.async {
                            self.verifyResult(data: data!)
                        }
                    }
                }
            }
            dataTask?.resume()
        }
    }
    
    func verifyResult(data: Data){
        // The result given is a String. The expected value for this example is the following.
        // true / false
        let value = NSString(data: data, encoding: String.Encoding.ascii.rawValue)
        
        // Advance to the next view, or send an alert of failure.
        if value == "true" {
            performSegue(withIdentifier: "authToSelection", sender: self)
        } else {
            let alertController = UIAlertController(title: "Incorrect", message:
                "Contraseñas incorrectas", preferredStyle: UIAlertControllerStyle.alert)
            self.present(alertController, animated: true, completion: nil)            }
    }
}
