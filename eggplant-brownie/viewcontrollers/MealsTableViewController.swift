//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by David Pedroza on 1/13/17.
//  Copyright © 2017 David Pedroza. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController {
    var meals = [Meal(name: "Comida da Vó", happiness: 5),
                 Meal(name: "Outback", happiness: 4),
                Meal(name: "Teatro Municipal", happiness: 3)]
    
    func add(meal:Meal) {
        meals.append(meal)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let view = segue.destination as! ViewController
        view.mealsTable = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        let meal = meals[row]
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        
        cell.textLabel!.text = meal.name
        
        return cell
    }
    
}
