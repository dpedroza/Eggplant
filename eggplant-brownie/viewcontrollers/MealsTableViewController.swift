//
//  MealsTableViewController.swift
//  eggplant-brownie
//
//  Created by David Pedroza on 1/13/17.
//  Copyright © 2017 David Pedroza. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController, AddMealDelegate {
    var meals:Array<Meal> = []
    
    func add(_ meal:Meal) {
        meals.append(meal)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "addMeal") {
            let view = segue.destination as! ViewController
            view.delegate = self
        }
    }
    
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
    
    func showDetails (recognizer: UILongPressGestureRecognizer)  {
        
        if (recognizer.state == UIGestureRecognizerState.began) {
            
            let cell = recognizer.view as! UITableViewCell
            
            if let indexPath = tableView.indexPath(for: cell) {
                let row = indexPath.row
                let meal = meals[row]
                print("Details shown for \(meal.name)")
            }
            
        }
    }
    
}
