//
//  TasksViewController.swift
//  Jobs
//
//  Created by Saurabh Sikka on 06/10/16.
//  Copyright © 2016 Saurabh Sikka. All rights reserved.
//

import UIKit
import RealmSwift

class TasksViewController: UITableViewController {
    
    @IBOutlet weak var filterButton: UIBarButtonItem!
    
    var tasks: Results<Task>!
    
    override func viewDidLoad() {
        let realm = try! Realm()
        tasks = realm.objects(Task)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    @IBAction func toggleFilter(sender: UIButton) {
        
    }
    
    //MARK: - Table methods
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let task = tasks[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("TaskCell") as! TaskCell
        cell.configureWithTask(task)
        return cell
    }
    
    
}
