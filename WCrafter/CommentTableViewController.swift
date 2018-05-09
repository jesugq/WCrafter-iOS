import UIKit

class CommentTableViewController: UITableViewController {
    
    // Attributes
    var comments = [Comment]()
    
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    // Prepared Attributes
    var userGiven : String = ""

    //
    // View Controller Functions
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        self.defineComments()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Identify each cell to have a specific format and interface layout.
        let cellIdentifier = "Comment"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CommentTableViewCell else {
            fatalError("The created instance is not a Comment.")
        }
        
        // Obtain the values from the item at position indexPath in the array.
        let comment = comments[indexPath.row]
        
        cell.addValues(username: comment.user, rating: comment.rating, comment: comment.comment)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    //
    // Functions
    //
    func defineComments() {
        self.hardcodeLoading()
        //_ = self.performLoading()
    }
    
    func hardcodeLoading() {
        let string = "Fer\n4.5\nMuy bien.\nChucho\n5\nNice.\nPaola\n3.5\nEstuvo bien.\nHumberto\n2\nNo."
        let data = string.data(using: String.Encoding(rawValue: String.Encoding.ascii.rawValue))
        
        _ = self.sendResult(data: data!)
    }
    
    func performLoading() -> Bool {
        // Prevents multiple data task sessions.
        if dataTask != nil {
            dataTask?.cancel()
        }
        
        // Temporary crafter receiving website. This will be changed to VW's official url.
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let url = NSURL(string: "https://www.iroseapps.com/moviles/comments.php?username=\(userGiven)")
        
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
                        _ = self.sendResult(data: data!)
                    }
                }
            }
        }
        dataTask?.resume()
        return true
    }
    
    func sendResult(data: Data) -> Bool{
        // The result given is a String. The expected value for this example is the following.
        // crafter1     (id of each car image)
        // KJS-91-21    (license plate of each car)
        let value = NSString(data: data, encoding: String.Encoding.ascii.rawValue)
        let valueArray : [String] = (value?.components(separatedBy: "\n"))!;
        
        if valueArray.count % 3 != 0 {
            return false
        }
        
        // Create the necessary amount of elements in the TableView.
        self.loadComments(valueArray: valueArray)
        return true
    }
    
    func loadComments(valueArray: [String]){
        // From the result given as a String, create a Crafter.
        for index in stride(from: 0, to: valueArray.count-2, by: 3) {
            guard let comment = Comment(user: valueArray[index], ratio: valueArray[index+1], comment: valueArray[index+2]) else {
                fatalError("Unable to create Comment.")
            }
            
            // Add said Crafter to the Array of Crafters.
            comments += [comment]
        }
        self.tableView?.reloadData()
    }
}
