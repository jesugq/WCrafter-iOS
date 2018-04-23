//
//  Selection.swift
//  WCrafter
//
//  Created by ITESM WCrafter Team on 05/04/18.
//  Copyright © 2018 WCrafter Team. All rights reserved.
//

import UIKit

class Selection : UIViewController {
    
    // UI Outlets
    @IBOutlet weak var welcome: UILabel!
    @IBOutlet weak var table: UITableView!
    
    // Attributes
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    // Values obtained from Authentication ViewController
    var userText : String = ""
    
    // View Controller Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // The prepare for segue sets the string value of userText.
        welcome.text! = "Saludos \(userText)"
        
        // Attempt to find the values for the table.
        //self.hardcodedLoading()
        //self.performLoading()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Functions
    /* Obtain data from the server, and attempt to verify the result once it's been received. */
    func performLoading(){
        // Prevents multiple data task sessions.
        if dataTask != nil {
            dataTask?.cancel()
        }
        
        // Temporary crafter receiving website. This will be changed to VW's official url.
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let url = NSURL(string: "https://www.iroseapps.com/moviles/loading.php")
        
        // Request information from an URL with a Data Task, calling function verifyResult if successful.
        let request = URLRequest(url: url! as URL)
        dataTask = defaultSession.dataTask(with: request){
            data, response, error in DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
            
            if let error = error {
                print(error.localizedDescription)
            } else if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    DispatchQueue.main.async{
                        self.fillTable(data: data!)
                    }
                }
            }
        }
        dataTask?.resume()
        return
    }
    
    /* Verifies the result from the Data Task performed, and adds the correct amount of TableCellViews to the table, then adds the images, type of vehicle and license plate of the vehicle per item. */
    func fillTable(data: Data){
        
    }

}
