//
//  ToDoListTableVC.swift
//  ToDoList App
//
//  Created by William Tsai on 1/23/18.
//  Copyright © 2018 William Tsai. All rights reserved.
//

import UIKit
import CoreData

class ToDoListTableVC: UITableViewController, AddNewTaskDelegate {
    
    var tasks = [Task]()
    
    let dateFormatter = DateFormatter()
    
    @IBOutlet var myTaskTable: UITableView!
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func addTaskBtnPressed(with task: String, with taskDetail: String, at taskDate: UIDatePicker) {
        let aNewTask = Task(context: managedObjectContext)
        aNewTask.name = task
        aNewTask.detail = taskDetail
        aNewTask.date = taskDate.date
        saveContextAndReload()
        dismiss(animated: true, completion: nil)
        print(tasks)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAndReload()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskCell
        cell.taskLabel.text = tasks[indexPath.row].name
        cell.detailLabel.text = tasks[indexPath.row].detail
        cell.dateLabel.text = dateFormatter.string(from: tasks[indexPath.row].date!)
        dateFormatter.dateStyle = .short
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myTaskTable.deselectRow(at: indexPath, animated: true)
        let selectedCell = myTaskTable.cellForRow(at: indexPath) as! TaskCell
        if selectedCell.accessoryType == .checkmark {
            selectedCell.accessoryType = .none
            selectedCell.taskLabel.isEnabled = true
            selectedCell.detailLabel.isEnabled = true
            selectedCell.dateLabel.isEnabled = true
        } else {
            selectedCell.accessoryType = .checkmark
            selectedCell.taskLabel.isEnabled = false
            selectedCell.detailLabel.isEnabled = false
            selectedCell.dateLabel.isEnabled = false
        }
    }
    
    func fetchAndReload() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Task")
        // Or Patrick's way: let request: NSFetchRequest<Task> = Task.fetchRequest()
        do {
            let result = try managedObjectContext.fetch(request) as! [Task]
            tasks = result
            myTaskTable.reloadData()
        } catch {
            print(error)
        }
    }

    func saveContextAndReload() {
        do {
            try managedObjectContext.save()
        } catch {
            print(error)
        }
        fetchAndReload()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! AddTaskVC
        destination.delegate = self

//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        let taskToDelete = tasks[indexPath.row]
//        managedObjectContext.delete(taskToDelete)
//        saveContextAndReload()
//    }
        
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    }

}
