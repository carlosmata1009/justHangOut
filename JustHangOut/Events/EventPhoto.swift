//
//  EventPhoto.swift
//  JustHangOut
//
//  Created by Carlos Mata on 9/24/18.
//  Copyright © 2018 Carlos Mata Fernandez. All rights reserved.
//

import Foundation
import Parse

class EventPhoto: PFObject, PFSubclassing {
    
    static func parseClassName() -> String {
    
        return "EventPhoto"
    }
    
    
    @NSManaged var message: String?
    @NSManaged var image: PFFile?
    @NSManaged var user: PFUser?
    
    override class func query() -> PFQuery<PFObject>? {
        
        let query = PFQuery(className: EventPhoto.parseClassName())
        query.whereKeyExists("user")
        query.includeKey("user")
    
        return query
    }
}
