//
//  Department.swift
//  Jobs
//
//  Created by Saurabh Sikka on 07/10/16.
//  Copyright © 2016 Saurabh Sikka. All rights reserved.
//

import Foundation
import RealmSwift

class Department: Object {
    
    
    var consultants: List<Doctor>!
    var patients: List<Patient>!
    


    
}
