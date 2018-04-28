import UIKit

class CrafterTableViewController: UITableViewController {

    // Attributes
    var crafters = [Crafter]()
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    // Prepared Attributes
    var photoSent : UIImage = UIImage(named: "crafter1")!
    var plateSent : String = ""
    var parentView : Selection? = nil
    
    //
    // ViewController Functions
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Attempt to get the Crafter list.
        self.hardcodeLoading()
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
        
        // Obtain the values from the item at position indexPath in the array.
        let crafter = crafters[indexPath.row]
        
        // Add the values in the cell.
        cell.addValues(photo: crafter.photo, plate: crafter.plate)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let crafter = crafters[indexPath.row]
        photoSent = crafter.photo
        plateSent = crafter.plate
        
        self.shareWithParent(photoSent: photoSent, plateSent: plateSent)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60;
    }
    
    //
    // Functions
    //
    func shareWithParent(photoSent: UIImage, plateSent: String) {
        parentView?.receiveFromChild(photoSent: photoSent, plateSent: plateSent)
        parentView?.advanceFromChild()
    }
    
    func hardcodeLoading(){
        let string = "crafter1\nUSA-03-64\ncrafter2\nIYO-23-81\ncrafter3\nNIL-76-21\ncrafter4\nINS-78-23\ncrafter5\nNEW-71-92"
        let data = string.data(using: String.Encoding(rawValue: String.Encoding.ascii.rawValue))
        
        self.sendResult(data: data!)
    }
    
    func performLoading(){
        // Prevents multiple data task sessions.
        if dataTask != nil {
            dataTask?.cancel()
        }
        
        // Temporary crafter receiving website. This will be changed to VW's official url.
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let url = NSURL(string: "https://www.iroseapps.com/moviles/crafters.php")
        
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
    
    func sendResult(data: Data){
        // The result given is a String. The expected value for this example is the following.
        // crafter1     (id of each car image)
        // KJS-91-21    (license plate of each car)
        let value = NSString(data: data, encoding: String.Encoding.ascii.rawValue)
        let valueArray : [String] = (value?.components(separatedBy: "\n"))!;
        
        // Create the necessary amount of elements in the TableView.
        self.loadCrafters(valueArray: valueArray)
    }
    
    func loadCrafters(valueArray: [String]){
        // From the result given as a String, create a Crafter.
        for index in stride(from: 0, to: valueArray.count-1, by: 2) {
            guard let crafter = Crafter(image: valueArray[index], plate: valueArray[index+1]) else {
                fatalError("Unable to create Crafter.")
            }
            
            // Add said Crafter to the Array of Crafters.
            crafters += [crafter]
        }
    }

}
