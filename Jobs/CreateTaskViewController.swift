//
//  CreateTaskViewController.swift
//  Jobs
//
//  Created by Saurabh Sikka on 06/10/16.
//  Copyright © 2016 Saurabh Sikka. All rights reserved.
//

import UIKit
import RealmSwift

class CreateTaskViewController: UITableViewController {
    
    @IBOutlet weak var taskTitle: UITextField!
    @IBOutlet weak var taskPriority: UISegmentedControl!
    @IBOutlet weak var taskConsultantType: UISegmentedControl!
    
    let users: [User] = {
        let realm = try! Realm()
        return Array(realm.objects(User))
    }()
    
    
    @IBAction func createTask(sender: UIButton) {
        let realm = try! Realm()
        let task = Task(title: taskTitle.text!, priority: taskPriority.selectedSegmentIndex)
        
        try! realm.write {
            realm.add(task)
        }
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
//        taskConsultantType.removeAllSegments()
        for user in users {
            taskConsultantType.insertSegmentWithTitle(user.name, atIndex: taskConsultantType.numberOfSegments, animated: false)
        }
        taskConsultantType.selectedSegmentIndex = 0
        
        taskTitle.becomeFirstResponder()
    }
    
}
