//
//  ViewController.swift
//  JustHangOut
//
//  Created by Carlos Mata on 9/24/18.
//  Copyright © 2018 Carlos Mata Fernandez. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var logoutButton: UIBarButtonItem!
    var eventPhoto = [EventPhoto]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        getEventPhoto()
    }
    func getEventPhoto(){
        
        let query = EventPhoto.query()
        query?.findObjectsInBackground { (objects, error) in
            
            if let objects = objects as? [EventPhoto]{
                
                self.eventPhoto = objects
                self.tableView.reloadData()
            }
        }
    }
    @IBAction func logout(_ sender: Any) {
        
        let alert = UIAlertController(title: "Do you want to logout?", message: "Click cancel to remain in the app", preferredStyle: .alert)
        
        let logoutAction = UIAlertAction(title: "Logout", style: .default) { (action) in
            PFUser.logOut()
            print("Hecho")
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(logoutAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
}
extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EventTableViewCell
        
        let eventsPhoto = eventPhoto[indexPath.row]
        cell.configureCell(eventsphoto: eventsPhoto)
         
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return eventPhoto.count
    }
}

