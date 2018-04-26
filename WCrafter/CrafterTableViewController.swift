//
//  CrafterTableViewController.swift
//  WCrafter
//
//  Created by Alumno on 23/04/18.
//  Copyright © 2018 Alumno. All rights reserved.
//

import UIKit

class CrafterTableViewController: UITableViewController {

    // Attributes
    var crafters = [Crafter]()
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    // Image Constants
    let photo1 = UIImage(named: "crafter1")
    let photo2 = UIImage(named: "crafter2")
    let photo3 = UIImage(named: "crafter3")
    let photo4 = UIImage(named: "crafter4")
    let photo5 = UIImage(named: "crafter5")
    
    // Functions
    
    /* TO BE DELETED: Harcoded creation of a String given by the server, this will be modified to match VW's official server. */
    func hardcodeLoading(){
        let string = "crafter1\nUSA-03-64\ncrafter2\nIYO-23-81\ncrafter3\nNIL-76-21\ncrafter4\nINS-78-23\ncrafter5\nNEW-71-92"
        let data = string.data(using: String.Encoding(rawValue: String.Encoding.ascii.rawValue))
        
        self.sendResult(data: data!)
    }
    
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
                        self.sendResult(data: data!)
                    }
                }
            }
        }
        dataTask?.resume()
        return
    }
    
    /* Verifies the result from the Data Task performed, and adds the correct amount of TableCellViews to the table, then adds the images, type of vehicle and license plate of the vehicle per item. */
    func sendResult(data: Data){
        // The result given is a String. The expected value for this example is the following.
        // crafter1     (id of each car image)
        // KJS-91-21    (license plate of each car)
        let value = NSString(data: data, encoding: String.Encoding.ascii.rawValue)
        let valueArray : [String] = (value?.components(separatedBy: "\n"))!;
        
        // Create the necessary amount of elements in the TableView.
        self.loadCrafters(valueArray: valueArray)
    }
    
    /* Create each Crafter Data Model and add it to the Array to send to each TableViewCell */
    func loadCrafters(valueArray: [String]){
        // From the result given as a String, create a Crafter.
        for index in stride(from:0, to: valueArray.count-1, by: 2) {
            guard let crafter = Crafter(image: valueArray[index], plate: valueArray[index+1]) else {
                fatalError("Unable to create Crafter.")
            }
            
            // Add said Crafter to the Array of Crafters.
            crafters += [crafter]
        }
        //Debugging
        /**/NSLog("%d\t%s", crafters.count, valueArray)
    }
    
    /* Select an image depending on the String given. */
    func givePhoto(image: String) -> UIImage {
        switch image {
        case "crafter1" :
            return photo1!
        case "crafter2" :
            return photo2!
        case "crafter3" :
            return photo3!
        case "crafter4" :
            return photo4!
        case "crafter5" :
            return photo5!
        default :
            return photo1!
        }
    }
    
    // ViewController Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Attempt to get the Crafter list.
        hardcodeLoading()
        //performLoading()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return crafters.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Identify each cell to have a specific format and interface layout.
        let cellIdentifier = "Crafter"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CrafterTableViewCell else {
            fatalError("The created instance is not a Crafter.")
        }
        
        // Obtain the values from each item in the Array.
        let crafter = crafters[indexPath.row]
        
        // Add the values in each cell.
        cell.photo.image = self.givePhoto(image: crafter.image)
        cell.plate.text = crafter.plate
        
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60;
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
