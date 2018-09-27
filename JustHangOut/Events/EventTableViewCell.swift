//
//  EventTableViewCell.swift
//  JustHangOut
//
//  Created by Carlos Mata on 9/22/18.
//  Copyright © 2018 Carlos Mata Fernandez. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImgView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    
    func configureCell(eventsphoto: EventPhoto) {
        
        let message = eventsphoto.message
        
        messageLabel.text = message
        
        guard let pfFile = eventsphoto.image else {return}
        pfFile.getDataInBackground { (data, error) in
            
            if let data = data{
                
                    self.photoImgView.image = UIImage(data: data)
            }
        }
    }
}
