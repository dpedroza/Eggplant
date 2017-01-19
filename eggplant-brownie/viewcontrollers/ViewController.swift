//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by David Pedroza on 1/12/17.
//  Copyright © 2017 David Pedroza. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddItemDelegate {

    // View fields
    
    @IBOutlet var nameField:UITextField?
    @IBOutlet var happinessField:UITextField?
    @IBOutlet var tableView: UITableView?
    
    var delegate: AddMealDelegate?
    
    // Dummie data
    
    var items = [
        Item(name: "Egg", calories: 50),
        Item(name: "Milk", calories: 200),
        Item(name: "Butter", calories: 520),
        Item(name: "Flour", calories: 130)]
    
    var selected = Array<Item>()
    
    // Add a new item to tableview
    
    func add(_ item: Item) {
        items.append(item)

        NSKeyedArchiver.archiveRootObject(items, toFile: getItemsFile())
        
        if let table = tableView {
            
            table.reloadData()
            
        } else {
            
            Alert(controller: self).show(title: "Erro", message: "Can't update tableview data")
            
        }
    }
    
    // Get the items file at the user directory
    
    func getItemsFile() -> String {
        
        let userDirs = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let dir = userDirs[0]
        let file = "\(dir)/eggplant-brownie-items.data"
        
        return file
    }
    
    // Bar Button Item is created and action func is setted
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let newItemButton = UIBarButtonItem(title: "New item",  style: UIBarButtonItemStyle.plain, target: self, action: #selector(ViewController.showNewItem))
        
        navigationItem.rightBarButtonItem = newItemButton

        if let loaded = NSKeyedUnarchiver.unarchiveObject(withFile: getItemsFile()) {
            self.items = loaded as! Array<Item>
        }
    }
    
    // Shows new item on the list
    
    func showNewItem() {
        let newItem = NewItemViewController(delegate: self)
        
        if let navigation = navigationController {
            navigation.pushViewController(newItem, animated: true)
        } else {
            Alert(controller: self).show()
        }
        
    }
    
    // Uses delegate to add a new meal to the list and navigate back
    
    @IBAction func add() {
        
        if let meal = getMealFromForm() {
            
            if let meals = delegate {
                meals.add(meal)
                if let navigation = navigationController {
                    navigation.popViewController(animated: true)
                } else {
                    Alert(controller: self).show(title: "Error", message: "Unable to go back, but the meal was added")
                }
                return
            }
        }
        Alert(controller: self).show()
    }
    
    // Receive and wrap the form text into a Meal object
    
    func getMealFromForm() -> Meal? {
    
        if let name = nameField?.text {
            if let happiness = convertToInt(happinessField?.text) {
                return Meal(name: name, happiness: happiness, items: selected)
            }
        }
        
        return nil
        
    }
    
    // String? to Int? converter
    
    func convertToInt (_ text: String?) -> Int? {
        if let number = text {
            return Int(number)
        }
        return nil
    }
    
    // Tableview functions
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        let item = items[row]
        
        cell.textLabel!.text = item.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let cell = tableView.cellForRow(at: indexPath) {
            
            let row = indexPath.row
            
            if cell.accessoryType == UITableViewCellAccessoryType.none {
                
                cell.accessoryType = UITableViewCellAccessoryType.checkmark
                let item = items[row]
                selected.append(item)
                
            } else {
                
                cell.accessoryType = UITableViewCellAccessoryType.none
                let item  = items[row]
                
                if let position = selected.index(of: item) {
                    selected.remove(at: position)
                }
                
            }
            
        }
    }

}

