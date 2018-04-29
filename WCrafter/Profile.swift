//
//  Profile.swift
//  WCrafter
//
//  Created by Alumno on 29/04/18.
//  Copyright © 2018 Alumno. All rights reserved.
//

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
    }
    
    //
    // UI Actions
    //
    @IBAction func changeSelfie(_ sender: UITapGestureRecognizer) {
        print("\nMe dieron click!\n")
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
    
}
