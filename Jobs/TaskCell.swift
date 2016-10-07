//
//  TaskCell.swift
//  Jobs
//
//  Created by Saurabh Sikka on 06/10/16.
//  Copyright © 2016 Saurabh Sikka. All rights reserved.
//

import UIKit
import RealmSwift

class TaskCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var priority: UILabel!
    @IBOutlet weak var checkButton: UIButton!

    @IBAction func toggleCheck(sender: AnyObject) {
        updateTask(!checkButton.selected)
    }
    
    private func updateTask(checked: Bool) {
        if let realm = try? Realm(),
            let id = self.taskId,
            let task = realm.objectForPrimaryKey(Task.self, key: id)
        {
            
            try! realm.write {
                task.done = checked
            }
            
            checkButton.selected = task.done
        }
    }
    
    var taskId: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureWithTask(task: Task) {
        taskId = task.taskId
        checkButton.selected = task.done
        title!.text = task.title
        priority!.text = task.priorityText
        priority!.textColor = task.priorityColor

        
    }
    
}
