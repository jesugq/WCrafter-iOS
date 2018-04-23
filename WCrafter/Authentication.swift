//
//  FirstViewController.swift
//  WCrafter
//
//  Created by ITESM WCrafter Team on 07/03/18.
//  Copyright © 2018 ITESM WCrafter Team. All rights reserved.
//

import UIKit

class Authentication: UIViewController {
    
    // UI Outlets
    @IBOutlet weak var user: UITextField!
    @IBOutlet weak var pass: UITextField!
    
    // Attributes
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    // View Controller Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        // Prepare the Selection ViewController to receive the username as the name to present.
        let newView = segue.destination as! Selection
        newView.userText = user.text!
    }
    
    // UI Actions
    @IBAction func login(_ sender: Any) {
        // Force true to advance without a server.
        /**/performSegue(withIdentifier: "authToSelection", sender: self)
        /**/return
            
        self.performLogin()
    }
    
    @IBAction func passForget(_ sender: Any) {
        // Algorithm to request a password reset sent to the email. This will be changed to VW's official format.
        printAlert(title: "Recuperación de Contraseña", message: "Recibirá un correo con instrucciones pronto.");
    }
    
    // Functions.
    /* Obtain data from the server, and attempt to verify the result once it's been received. */
    func performLogin(){
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
        return
    }
    
    /* Verifies the result from the Data Task performed, and starts a Segue or throws an Error depending on the entire value. The input would be seen as "true" or "false". This will be changed to VW's official output. */
    func verifyResult(data: Data){
        let value = NSString(data: data, encoding: String.Encoding.ascii.rawValue)
        
        // Advance to the next view, or send an alert of failure.
        if value == "true" {
            performSegue(withIdentifier: "authToSelection", sender: self)
        } else {
            printAlert(title: "Credenciales Inválidas", message: "El usuario y/o contraseña ingresados son incorrectos.")
            return
        }
    }
    
    /* Generic alert creator for multiple methods, receiving the title and the message to print. */
    func printAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
}

