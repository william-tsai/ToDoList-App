//
//  ToDoTasksTableViewCell.swift
//  ToDoList App
//
//  Created by William Tsai on 1/23/18.
//  Copyright © 2018 William Tsai. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
    
    var task: String?
    var detail: String?
    var date: Date?
    
    @IBOutlet var taskLabel: UILabel!
    
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var detailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
