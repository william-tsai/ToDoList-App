//
//  ViewController.swift
//  ToDoList App
//
//  Created by William Tsai on 1/23/18.
//  Copyright © 2018 William Tsai. All rights reserved.
//

import UIKit

protocol AddNewTaskDelegate: class {
    func addTaskBtnPressed(with task: String, with taskDetail: String, at taskDate: UIDatePicker)
}

class AddTaskVC: UIViewController {

    var newTask: String?
    var newTaskDetail: String?
    var newTaskDate: UIDatePicker?
    
    var delegate: AddNewTaskDelegate?
    
    @IBOutlet var newTaskField: UITextField!
    
    @IBOutlet var newDetailTextView: UITextView!
    
    @IBOutlet var newTaskDatePicker: UIDatePicker!
    
    @IBOutlet var AddTaskButton: UIButton!
    
    @IBAction func addTaskBtnPressed(_ sender: UIButton) {
        if newTaskField.text?.isEmpty == true || newDetailTextView.text?.isEmpty == true {
            print("Can't add")
        } else {
            print("Can add")
            delegate?.addTaskBtnPressed(with: newTaskField.text!, with: newDetailTextView.text!, at: newTaskDatePicker!)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

