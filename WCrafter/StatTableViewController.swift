import UIKit

class StatTableViewController: UITableViewController {
    
    // Attributes
    var stats = [Stat]()
    
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?

    //
    // View Controller Functions
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        self.defineStats()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stats.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Identify each cell to have a specific format and interface layout.
        let cellIdentifier = "Stat"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? StatTableViewCell else {
            fatalError("The created instance is not a Stat.")
        }
        
        // Obtain the values from the item at position indexPath in the array.
        let stat = stats[indexPath.row]
        
        cell.addValues(photo: stat.photo, value: stat.value, descr: stat.descr)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func defineStats() {
        stats = [Stat]()
        self.hardcodeLoading()
        //self.performLoading()
    }
    
    func hardcodeLoading() {
        let string = "card\n3G1F08\nodometerdelta\n13.4\nroad\n8465 KM\nbattery\nRegular\nenginetime\n13 horas\nodometer\nRP\nspeed\n52 KM/hora\nspeedbreak\n8465\nengine\nRegular"
        let data = string.data(using: String.Encoding(rawValue: String.Encoding.ascii.rawValue))
        
        _ = self.sendResult(data: data!)
    }
    
    func performLoading() -> Bool {
        // Prevents multiple data task sessions.
        if dataTask != nil {
            dataTask?.cancel()
        }
        
        // Temporary login website. This will be changed to VW's official url.
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let url = NSURL(string: "http://www.iroseapps.com/moviles/stats.php)")
        
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
        // card     (statistic type)
        // 3G1F08   (statistic value)
        let value = NSString(data: data, encoding: String.Encoding.ascii.rawValue)
        let valueArray : [String] = (value?.components(separatedBy: "\n"))!
        
        if valueArray.count % 2 != 0 {
            return false
        }
        
        // Create the necessary amount of elements for the TableView.
        self.loadStats(valueArray: valueArray)
        return true
    }
    
    func loadStats(valueArray: [String]) {
        // From the result given as a String, create a Stat.
        for index in stride(from: 0, to: valueArray.count-1, by: 2) {
            print("\n\(index)\n")
            guard let stat = Stat(type: valueArray[index], value: valueArray[index+1]) else {
                fatalError("Unable to create Stat.")
            }
            
            // Add said Stat to the Array of Stats.
            stats += [stat]
        }
        self.tableView?.reloadData()
    }

    
}
