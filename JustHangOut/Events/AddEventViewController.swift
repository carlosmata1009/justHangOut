//
//  EventViewController.swift
//  JustHangOut
//
//  Created by Carlos Mata on 9/22/18.
//  Copyright © 2018 Carlos Mata Fernandez. All rights reserved.
//

import UIKit
import Parse

class AddEventViewController: UIViewController {

    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var messageTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func close(_ sender: Any) {
    
    dismiss(animated: true, completion: nil)
    }
    
    @IBAction func post(_ sender: Any) {
   
        guard let message = messageTextView.text, let image = photoView.image, let user = PFUser.current() else {return}
        
            /*
            let photo = PFObject(className: "EventPhoto")
            photo["message"] = message
            photo["image"] = PFFile(name: "Eventsphoto.png", data: UIImagePNGRepresentation(image)!)
            photo["user"] = user
            photo.saveInBackground()
            */
            let eventPhoto = EventPhoto()
            eventPhoto.message = message
            eventPhoto.user = user
            eventPhoto.image = PFFile(name: "photo.png", data: UIImagePNGRepresentation(image)!)
        
            eventPhoto.saveInBackground() { (succeed, error) in
                
                if succeed == true {
                print("Jamon")
                } else {
              
                let localised = (error?.localizedDescription)!
                
                Helper.shared.showAlert(title: "Error", message: localised, viewController: self)
           
            }
        }
    }
    
    @IBAction func choosePhoto(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = true
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            
            present(imagePicker, animated: true)
        }
    }
}

extension AddEventViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        guard let image = info[UIImagePickerControllerEditedImage] as? UIImage else {
            return}
        
        photoView.image = image
        
        dismiss(animated: true, completion: nil)
        }
        
    }

