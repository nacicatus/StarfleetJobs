//
//  User.swift
//  Jobs
//
//  Created by Saurabh Sikka on 07/10/16.
//  Copyright © 2016 Saurabh Sikka. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    
    dynamic var name = ""
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}
