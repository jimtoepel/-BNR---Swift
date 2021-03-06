//
//  TodoList.swift
//  superDoodle
//
//  Created by Jim Toepel on 6/5/16.
//  Copyright © 2016 FunderDevelopment. All rights reserved.
//

import UIKit

class TodoList: NSObject {
    private let fileURL: NSURL = {
        let documentDirectoryURLs = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentDirectoryURL = documentDirectoryURLs.first!
        return documentDirectoryURL.URLByAppendingPathComponent("todolist.items")
    }()

    private var items: [String] = []

    
    override init() {
        super.init()
        loadItems()
    }
    
    func saveItems() {
        let itemsArray = items as NSArray
        
        print("Saving items to \(fileURL)")
        if !itemsArray.writeToURL(fileURL, atomically: true) {
            print("Could not save to-do list")
        }
    }
    
    
    func loadItems() {
        if let itemsArray = NSArray(contentsOfURL: fileURL) as? [String] {
            items = itemsArray
        }
    }
    
    
    func addItem(item: String) {
        items.append(item)
        saveItems()
    }
    
    func removeItem(index: Int) {
        items.removeAtIndex(index)
        saveItems()
    }
    
}

extension TodoList: UITableViewDataSource {
    
    
    var getCellInfo: (cellClass: AnyClass, reuseIdentifier: String) {
        return (UITableViewCell.self, "Cell")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(getCellInfo.reuseIdentifier, forIndexPath: indexPath)
        let item = items[indexPath.row]
        cell.textLabel!.text = item
        
        return cell
    }
}