import UIKit

class Authentication: UIViewController {
    
    // UI Outlets
    @IBOutlet weak var user: UITextField!
    @IBOutlet weak var pass: UITextField!
    
    // Attributes
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    // Prepared Attributes
    var userSent : String = ""
    
    //
    // View Controller Functions
    //
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Hide keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Prepare the Selection ViewController to receive the username as the name to present.
        let newView = segue.destination as! Selection
        userSent = user.text!
        newView.userGiven = userSent
    }
    
    //
    // UI Actions
    //
    @IBAction func login(_ sender: Any) {
        self.hardcodeLogin()
        //self.performLogin()
    }
    
    @IBAction func passForget(_ sender: Any) {
        // Algorithm to request a password reset sent to the email. This will be changed to VW's official format.
        printAlert(title: "Recuperación de Contraseña", message: "Recibirá un correo con instrucciones pronto.")
    }
    
    //
    // Functions
    //
    func hardcodeLogin() {
        // Prevents logins with no values.
        if user.text!.isEmpty || pass.text!.isEmpty {
            printAlert(title: "Credenciales vacías.", message: "El usuario y/o contraseña se encuentran vacíos.")
            return
        }
        
        performSegue(withIdentifier: "authToSelect", sender: self)
    }
    
    func performLogin() {
        // Prevents multiple data task sessions.
        if dataTask != nil {
            dataTask?.cancel()
        }
        
        // Prevents logins with no values.
        if user.text!.isEmpty || pass.text!.isEmpty {
            printAlert(title: "Credenciales vacías.", message: "El usuario y/o contraseña se encuentran vacíos.")
            return
        }
        
        // Convert the characters to php compatible format.
        let userEntry = user.text!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let passEntry = pass.text!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        // Temporary login website. This will be changed to VW's official url.
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let url = NSURL(string: "http://www.iroseapps.com/moviles/login.php?username=\(userEntry)&password=\(passEntry)")
        
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
    
    func verifyResult(data: Data){
        // The result given is a String. The expected value for this example is the following.
        // true / false
        let value = NSString(data: data, encoding: String.Encoding.ascii.rawValue)
        
        // Advance to the next view, or send an alert of failure.
        if value == "true" {
            performSegue(withIdentifier: "authToSelection", sender: self)
        } else {
            printAlert(title: "Credenciales Inválidas", message: "El usuario y/o contraseña ingresados son incorrectos.")
        }
    }
    
    func printAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
}

