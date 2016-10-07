//
//  Task.swift
//  Jobs
//
//  Created by Saurabh Sikka on 06/10/16.
//  Copyright © 2016 Saurabh Sikka. All rights reserved.
//

import Foundation
import RealmSwift

class Task: Object {
    
    dynamic var taskId = NSUUID().UUIDString
    
    dynamic var title = ""
    dynamic var created = NSDate()
    dynamic var done = false
    dynamic var priority = 0
    
    override class func primaryKey() -> String? {
        return "taskId"
    }
    
    override class func indexedProperties() -> [String] {
        return ["done"]
    }
    
    convenience init(title: String, priority: Int) {
        self.init()
        self.title = title
        self.priority = priority
    }
    
}

extension Task {
    
    var priorityText: String {
        return priority > 0 ? "High" : "Default"
    }
    
    var priorityColor: UIColor {
        return priority > 0 ? UIColor.redColor() : UIColor.blueColor()
    }
    
}