import UIKit

class PostTableViewController: UITableViewController {

    // Attributes
    var posts = [Post]()
    var typeGiven : String = ""
    
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    //
    // View Controller Functions
    //
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Identify each cell to have a specific format and interface layout.
        let cellIdentifier = "Post"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? PostTableViewCell else {
            fatalError("The created instance is not a Post.")
        }
        
        // Obtain the values from the item at position indexPath in the array.
        let post = posts[indexPath.row]
        
        // Add in the values in the cell
        cell.addValues(desc: post.desc, code: post.code)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    //
    // Functions
    //
    func updateType() {
        // Reinitialize the posts array for values of the other type.
        posts = [Post]()
        self.hardcodeLoading()
        //_ = self.performLoading()
    }
    
    func hardcodeLoading() {
        if typeGiven == "Notificaciones" {
            let string = "Mantenimiento del motor\nMDM-817\nRevision del vehiculo\nRVV-812\nMantenimiento preventivo\nMPR-901"
            let data = string.data(using: String.Encoding(rawValue: String.Encoding.ascii.rawValue))
            
            _ = self.sendResult(data: data!)
        } else if typeGiven == "Fallas" {
            let string = "Falla de Motor\nXYZ-781\nSobrecalentamiento\nSBC-681"
            let data = string.data(using: String.Encoding(rawValue: String.Encoding.ascii.rawValue))
            
            _ = self.sendResult(data: data!)
        }
    }
    
    func performLoading() -> Bool {
        // Prevents multiple data task sessions.
        if dataTask != nil {
            dataTask?.cancel()
        }
        
        // Convert the characters to php compatible format.
        let typeEntry = typeGiven.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        // Temporary login website. This will be changed to VW's official url.
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let url = NSURL(string: "http://www.iroseapps.com/moviles/\(typeEntry).php)")
        
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
                        _ = self.sendResult(data: data!)
                    }
                }
            }
        }
        dataTask?.resume()
        return true
    }
    
    func sendResult(data: Data) -> Bool {
        // The result given is a String. The expected value for this example is the following.
        // Motor failure    (Description for each post)
        // MF-09            (Error code for each post)
        let value = NSString(data: data, encoding: String.Encoding.ascii.rawValue)
        let valueArray : [String] = (value?.components(separatedBy: "\n"))!
        
        if valueArray.count % 2 != 0 {
            return false
        }
        
        // Create the necessary amount of elements for the TableView.
        self.loadPosts(valueArray: valueArray)
        return true
    }
    
    func loadPosts(valueArray : [String]) {
        // From the result given as a String, create a Post.
        for index in stride(from: 0, to: valueArray.count-1, by: 2) {
            guard let post = Post(desc: valueArray[index], code: valueArray[index+1]) else {
                fatalError("Unable to create Post.")
            }
            
            // Add said Post to the Array of Posts.
            posts += [post]
        }
        self.tableView?.reloadData()
    }
    
}
