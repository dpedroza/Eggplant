//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by David Pedroza on 1/13/17.
//  Copyright © 2017 David Pedroza. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController, AddMealDelegate {
    
    // Dummie data
    
    var meals:Array<Meal> = [
    Meal(name: "Cake", happiness: 3),
    Meal(name: "Milk Shake", happiness: 5),
    Meal(name: "Strogonoff", happiness: 4)]
    
    override func viewDidLoad() {
        meals = MealsDao().loadMeals()
    }
    
    // Add a meal to table view and reload it
    
    func add(_ meal:Meal) {
        meals.append(meal)
        MealsDao().saveMeals(meals)
        tableView.reloadData()
    }
    
    // Pass the delegate reference to ViewController
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "addMeal") {
            let view = segue.destination as! ViewController
            view.delegate = self
        }
    }
    
    // Show modal with meal details
    
    func showDetails (recognizer: UILongPressGestureRecognizer)  {
        
        if (recognizer.state == UIGestureRecognizerState.began) {
            
            let cell = recognizer.view as! UITableViewCell
            
            if let indexPath = tableView.indexPath(for: cell) {
                
                let row = indexPath.row
                let meal = meals[row]
                
                func removeSelected(action: UIAlertAction) {
                    meals.remove(at: row) 
                    tableView.reloadData()
                }
                
                RemoveMealController(controller: self).show(meal, handler: removeSelected)
                
            }
            
        }
    }

    // Tableview functions
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        let meal = meals[row]
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
        
        cell.textLabel!.text = meal.name
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(showDetails))
        
        cell.addGestureRecognizer(longPress)
        
        return cell
    }
}
