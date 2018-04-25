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
        for index in stride(from:1, to: valueArray.count, by: 2) {
            guard let crafter = Crafter(image: valueArray[index], plate: valueArray[index+1]) else {
                fatalError("Unable to create Crafter.")
            }
            
            // Add said Crafter to the Array of Crafters.
            crafters += [crafter]
        }
    }
    
    // ViewController Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Attempt to get the Crafter list.
        hardcodeLoading()
        //performLoading()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return crafters.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Identify each cell to have a specific format and interface layout.
        let cellIdentifier = "CrafterTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CrafterTableViewCell else {
            fatalError("The created instance is not a Crafter.")
        }
        
        // Obtain the values from each item in the Array.
        let crafter = crafters[indexPath.row]
        
        // Add the values in each cell.
        switch crafter.image {
        case "crafter1" :
            cell.photo.image = photo1
            break
        case "crafter2" :
            cell.photo.image = photo2
            break
        case "crafter3" :
            cell.photo.image = photo3
            break
        case "crafter4" :
            cell.photo.image = photo4
            break
        case "crafter5" :
            cell.photo.image = photo5
            break
        default :
            cell.photo.image = photo1
        }
        cell.plate.text = crafter.plate
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
