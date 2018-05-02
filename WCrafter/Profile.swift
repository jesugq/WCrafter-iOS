import UIKit

class Profile: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Attributes
    var imagePicker = UIImagePickerController()
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    // Prepared Attributes
    var userGiven : String = ""
    
    // UI Outlets
    @IBOutlet weak var selfie: UIImageView!
    @IBOutlet weak var driver: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    //
    // View Controller Functions
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadImage()
        self.hardcodeDriver()
        //self.performDriver()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // Dismiss itself with no changes to the gallery.
        self.dismiss(animated: true, completion: { () -> Void in })
        
        if let image = info [UIImagePickerControllerOriginalImage] as? UIImage {
            selfie.image = image
        }
        self.saveImage()
    }
    
    //
    // UI Actions
    //
    @IBAction func changeSelfie(_ sender: UITapGestureRecognizer) {
        self.callPickerController()
    }
    
    //
    // Functions
    //
    func callPickerController() {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func saveImage() {
        let fileManager = FileManager.default
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).strings(byAppendingPaths: ["driver.jpg"])
        fileManager.createFile(atPath: paths[0], contents: UIImageJPEGRepresentation(selfie.image!, 1), attributes: nil)
    }
    
    func loadImage() {
        let fileManager = FileManager.default
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let imagePath = (paths[0] as NSString).appendingPathComponent("driver.jpg")
        
        if fileManager.fileExists(atPath: imagePath) {
            selfie.image = UIImage(contentsOfFile: imagePath)
        }
    }
    
    func hardcodeDriver() {
        let string = "Patricia Gonzalez\n4.5"
        let data = string.data(using: String.Encoding(rawValue: String.Encoding.ascii.rawValue))
        
        self.verifyResult(data: data!)
    }
    
    func performDriver() {
        // Prevents multiple data task sessions.
        if dataTask != nil {
            dataTask?.cancel()
        }
        
        // Convert the characters to php compatible format.
        let driverEntry = userGiven.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        // Temporary login website. This will be changed to VW's official url.
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let url = NSURL(string: "http://www.iroseapps.com/moviles/rating.php?username=\(driverEntry)")
        
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
        // Patricia González    (driver name)
        // 4.5                  (driver rating)
        let value = NSString(data: data, encoding: String.Encoding.ascii.rawValue)
        let valueArray : [String] = (value?.components(separatedBy: "\n"))!;
        
        updateDriver(driver: valueArray[0])
        updateRating(rating: Float(valueArray[1])!)
    }
    
    func updateDriver(driver : String) {
        self.driver.text = driver
    }
    
    func updateRating(rating: Float) {
        self.rating.text = "Puntuación: \(rating)"
    }
}
