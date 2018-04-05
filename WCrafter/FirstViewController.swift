//
//  FirstViewController.swift
//  WCrafter
//
//  Created by ITESM WCrafter Team on 07/03/18.
//  Copyright © 2018 ITESM WCrafter Team. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    // UI Outlets
    @IBOutlet weak var user: UITextField!
    @IBOutlet weak var pass: UITextField!
    
    // Attributes
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    // UI Actions
    @IBAction func login(_ sender: Any) {
        // Prevents multiple data task sessions.
        if dataTask != nil {
            dataTask?.cancel()
        }
        
        // Prevents logins with no values.
        if user.text!.isEmpty || pass.text!.isEmpty {
            printInvalid(title: "Credenciales vacías.", message: "El usuario y/o contraseña se encuentran vacíos.")
            return
        }
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        let userEntry = user.text!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let passEntry = pass.text!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        // Temporary login website. Change to VW's official when available.
        let url = NSURL(string: "http://www.iroseapps.com/moviles/login.php?username=\(userEntry)&password=\(passEntry)")
        
        let request = URLRequest(url: url! as URL)
        dataTask = defaultSession.dataTask(with: request){
            data, response, error in DispatchQueue.main.async{
                UIApplication.shared.isNetworkActivityIndicatorVisible = false;
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
    
    @IBAction func passForget(_ sender: Any) {
        // Algorithm to request a password reset sent to the email. Code at a later time.
    }
    
    // Functions
    func verifyResult(data: Data){
        let value = NSString(data: data, encoding: String.Encoding.ascii.rawValue)
        
        // Algorithm to pass to the next view. Code at a later time.
        // if value == "true" { nextView() }
        if value == "false" {
            printInvalid(title: "Credenciales Inválidas", message: "El usuario y/o contraseña ingresados son incorrectos.")
            return
        }
    }
    
    func printInvalid(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

