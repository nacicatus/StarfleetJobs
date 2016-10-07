//
//  Doctor.swift
//  Jobs
//
//  Created by Saurabh Sikka on 07/10/16.
//  Copyright © 2016 Saurabh Sikka. All rights reserved.
//

import Foundation
import RealmSwift

class Doctor: Object {
    
    dynamic var firstName = ""
    dynamic var lastName = ""
    dynamic var employeeID = ""
    dynamic var password = ""
//    dynamic var department: Department!
//    dynamic var seniority = 0
//    
//    var patientsList: List<Patient>!
//    
//    var seniorityLevel: String {
//        return seniority > 0 ? "Consultant" : "Resident"
//    }

    
    convenience init(firstName: String, lastName: String, password: String, employeeID: String) {
        self.init()
        self.firstName = firstName
        self.lastName = lastName
        self.password = password
//        self.department = department
        self.employeeID = employeeID
    }
    
}
