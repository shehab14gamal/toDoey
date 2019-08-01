//
//  ViewController.swift
//  toDoey
//
//  Created by shehab on 7/20/19.
//  Copyright © 2019 shehab. All rights reserved.
//
import CoreData
import UIKit


class TodoListViewController: UITableViewController {
var itemArray = [Item]()
    let DataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Item.Plist")
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
       
        print(DataFilePath)
        
  
      // loadItems()
    
     
        // Do any additional setup after loading the view, typically from a nib.
    }

   
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
      
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
       itemArray[indexPath.row].done = !itemArray[indexPath.row].done
       saveItems()
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }

    @IBAction func barButton(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "add new Todoey item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "add item", style: .default) { (action) in
            
            let newItem = Item(context: self.context)
            newItem.title = textField.text!
            newItem.done = false
            self.itemArray.append(newItem)
          self.saveItems()
           // self.defaults.set(self.itemArray, forKey: "ToDoeyListArray")
            
           
            //
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "create an item"
           textField = alertTextField
        }
        
        
        
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        
        
    }
    func saveItems(){
        
        do {
            try context.save()
        }catch{
            print("error saving context \(error)")
        }
        tableView.reloadData()
    }
  //  func loadItems(){
     //   if   let data = try? Data(contentsOf: DataFilePath!){
    //    let decoder = PropertyListDecoder()
         //   do{
      //  itemArray = try decoder.decode([Item].self, from: data)
         //   }catch{
        //        print("error decoding itemArray\(error)")
          //  }
  //  }
    
//}
}
