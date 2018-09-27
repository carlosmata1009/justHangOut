//
//  Helper.swift
//  JustHangOut
//
//  Created by Carlos Mata on 9/25/18.
//  Copyright © 2018 Carlos Mata Fernandez. All rights reserved.
//

import Foundation
import UIKit

class Helper{
    
    static let  shared = Helper()
    
    func showAlert(title: String, message: String, viewController: UIViewController){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        viewController.present(alert, animated: true)
        
        return
    }
}

