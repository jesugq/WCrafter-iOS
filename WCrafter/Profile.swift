import UIKit

class Profile: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Attributes
    var imagePicker = UIImagePickerController()
    
    // UI Outlets
    @IBOutlet weak var selfie: UIImageView!
    
    //
    // View Controller Functions
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadImage()
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
}
