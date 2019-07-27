//
//  ViewController.swift
//  toDoey
//
//  Created by shehab on 7/20/19.
//  Copyright © 2019 shehab. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
var itemArray = [Item]()
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        if let items = defaults.array(forKey: "ToDoeyListArray")as? [Item]{
            //itemArray = items
       }
        
       var newItem = Item()
        newItem.tiltle = "Find Miky "
        newItem.done = false
        itemArray.append(newItem)
        var newItem2 = Item()
        newItem2.tiltle = "shehab"
        newItem2.done = false
        itemArray.append(newItem2)
        var newItem3 = Item()
        newItem3.tiltle = "gamal"
        newItem3.done = false
        itemArray.append(newItem3)
        
    
     
        // Do any additional setup after loading the view, typically from a nib.
    }

   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.tiltle
        cell.accessoryType = item.done ? .checkmark : .none
      
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
       itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        tableView.reloadData()
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }

    @IBAction func barButton(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "add new Todoey item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "add item", style: .default) { (action) in
            
            var newItem = Item()
            newItem.tiltle = textField.text!
            self.itemArray.append(newItem)
            
            
            self.defaults.set(self.itemArray, forKey: "ToDoeyListArray")
            
            self.tableView.reloadData()
            //
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "create an item"
           textField = alertTextField
        }
        
        
        
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        
        
    }
    
}
