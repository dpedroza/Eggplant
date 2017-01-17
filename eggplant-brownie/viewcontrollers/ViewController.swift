//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by David Pedroza on 1/12/17.
//  Copyright © 2017 David Pedroza. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddItemDelegate {

    @IBOutlet var nameField:UITextField?
    @IBOutlet var happinessField:UITextField?
    var delegate: AddMealDelegate?
    
    var items = [
        Item(name: "Eggplant", calories: 100),
        Item(name: "Goiabada", calories: 200),
        Item(name: "Queijinho", calories: 523),
        Item(name: "Sanduba", calories: 30)]
    var selected = Array<Item>()
    
    @IBOutlet var tableView: UITableView?
    
    func add(_ item: Item) {
        items.append(item)
        if let table = tableView {
            
            table.reloadData()
            
        } else {
            
            Alert(controller: self).show(title: "Erro", message: "Falha ao atualizar dados da tabela")
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let newItemButton = UIBarButtonItem(title: "New item",  style: UIBarButtonItemStyle.plain, target: self, action: #selector(ViewController.showNewItem))
        
        navigationItem.rightBarButtonItem = newItemButton
    }
    
    func showNewItem() {
        let newItem = NewItemViewController(delegate: self)
        
        if let navigation = navigationController {
            navigation.pushViewController(newItem, animated: true)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func add() {
        
        if (nil == nameField || nil == happinessField) {
            return
        }
        
        let name:String = nameField!.text!
        if let happiness:Int = Int(happinessField!.text!) {
            
            let meal = Meal(name: name, happiness: happiness, items: selected)
            
            print("eaten \(meal.name) with happiness \(meal.happiness) with \(meal.items)")
            
            if (delegate == nil) {
                return
            }
            
            delegate?.add(meal)
            
            if let navigation = navigationController {
                    navigation.popViewController(animated: true)
            }
            
        }
        
    }
    
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

