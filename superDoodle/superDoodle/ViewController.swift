//
//  ViewController.swift
//  superDoodle
//
//  Created by Jim Toepel on 6/1/16.
//  Copyright © 2016 FunderDevelopment. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var itemTextField: UITextField!
    @IBOutlet var tableView: UITableView!
    
    let todoList = TodoList ()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let cellInfo = todoList.getCellInfo
        tableView.registerClass(cellInfo.cellClass, forCellReuseIdentifier: cellInfo.reuseIdentifier)
        tableView.dataSource = todoList
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonPressed(sender: UIButton) {
        guard let text = itemTextField.text else {
            return
        }
        if text != "" {
            todoList.addItem(text)
            itemTextField.text = ""
            tableView.reloadData()
        }
    }


}

