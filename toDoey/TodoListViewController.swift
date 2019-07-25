//
//  ViewController.swift
//  toDoey
//
//  Created by shehab on 7/20/19.
//  Copyright © 2019 shehab. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
var itemArray = ["Find Miky ", "Buy Eggos", "Destroy Demogorgon"]
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        if let items = defaults.array(forKey: "ToDoeyListArray")as? [String]{
            itemArray = items
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
        
        if   tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark{
            
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
    }

    @IBAction func barButton(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "add new Todoey item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "add item", style: .default) { (action) in
            self.itemArray.append(textField.text!)
            
            
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
