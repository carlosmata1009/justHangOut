//
//  LoginViewController.swift
//  JustHangOut
//
//  Created by Carlos Mata on 9/24/18.
//  Copyright © 2018 Carlos Mata Fernandez. All rights reserved.
//

import UIKit
import Parse

class RegisterViewController: UIViewController {

    
    @IBOutlet weak var usernameTf: UITextField!
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func register(_ sender: Any) {
    
        guard let username = usernameTf.text, let password = passwordTf.text else {return}
        let user = PFUser()
        user.username = username.lowercased()
        user.password = password
        
        user.signUpInBackground { (succeed, error) in
            
            if succeed == true {
                
                print("Jamon")

            } else {
                let localised = (error?.localizedDescription)!
                
                Helper.shared.showAlert(title: "Error", message: localised, viewController: self)
            }
        }
        
    }
    
    
    @IBAction func close(_ sender: Any) {
    
        dismiss(animated: true, completion: nil)
    }

}
