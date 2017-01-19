//
//  MealsDao.swift
//  eggplant-brownie
//
//  Created by David Pedroza on 1/19/17.
//  Copyright © 2017 David Pedroza. All rights reserved.
//

import Foundation

class MealsDao {
    
    // Save meals list at the user directory
    
    func saveMeals(_ meal: Array<Meal>) {
        NSKeyedArchiver.archiveRootObject(meal, toFile: getMealsFile())
    }
    
    // Load meals list from user directory
    
    func loadMeals() -> Array<Meal> {
        return NSKeyedUnarchiver.unarchiveObject(withFile: getMealsFile()) as! Array<Meal>
    }
    
    // Get the meals file at the user directory
    
    func getMealsFile() -> String {
        
        let userDirs = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let dir = userDirs[0]
        let file = "\(dir)/eggplant-brownie-meals.data"
        
        return file
        
    }
}
