//
//  RegisterViewController.swift
//  Jobs
//
//  Created by Saurabh Sikka on 07/10/16.
//  Copyright © 2016 Saurabh Sikka. All rights reserved.
//

import UIKit
import RealmSwift

class RegisterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var departmentPicker: UIPickerView!
    @IBOutlet weak var senioritySegmentControl: UISegmentedControl!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var employeeIdTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    
    
    
    
    // Picker View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        departmentPicker.delegate = self
        departmentPicker.dataSource = self
        
    }
    
    var departmentsPickerDataSource = ["Internal Medicine", "Cardiology", "Endocrinology", "Gastroenterology"]
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return departmentsPickerDataSource.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return departmentsPickerDataSource[row]
    }
    
    var departmentName = ""
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.departmentPicker.backgroundColor = UIColor(colorLiteralRed: Float(row)+1.3, green: Float(row)/3, blue: Float(row)/4, alpha: 1.0)
        return departmentName = departmentsPickerDataSource[row]
    }
    
    
    
    
    @IBAction func registerDoctor(sender: UIButton) {
        
        // assign parameters
        let firstName = firstNameTextField.text!
        let lastName = lastNameTextField.text!
        let employeeIdentification = employeeIdTextField.text!
        let password = passwordTextField.text!
        let repeatPassword = repeatPasswordTextField.text!
        var seniorityLevel: String {
            return senioritySegmentControl.selectedSegmentIndex > 0 ? "Consultant" : "Resident"
        }
        
        // check fields are all filled in
        if (firstName.isEmpty || lastName.isEmpty || employeeIdentification.isEmpty || password.isEmpty || departmentName.isEmpty) {
            displayAlertMessage("All Fields are Required")
        }
        
        // check password validity
        if password.isEmpty || repeatPassword.isEmpty {
            displayAlertMessage("Passwords do not match")
        }
        
        // validate doctors from realm
        let doctors: [Doctor] = {
            let realmOfDoctors = try! Realm()
            return Array(realmOfDoctors.objects(Doctor))
        }()
        
        let doctorToBeRegistered = Doctor(firstName: firstName, lastName: lastName, password: password, employeeID: employeeIdentification)
        
        for doc in doctors {
            if doc.employeeID != doctorToBeRegistered.employeeID {
                // register doctor
                let realm = try! Realm()
                try! realm.write {
                    realm.add(doctorToBeRegistered)
                    print(doctors)
                    self.dismissViewControllerAnimated(true, completion: nil)
                }
            } else {
                displayAlertMessage("This doctor is already registered")
            }
        }
        
        
        
        
    }
    
    
    @IBAction func goBackToLoginPage(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func displayAlertMessage(userMessage: String) {
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil)
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
}
