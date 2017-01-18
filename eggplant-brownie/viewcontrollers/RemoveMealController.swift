//
//  RemoveMealController.swift
//  eggplant-brownie
//
//  Created by David Pedroza on 1/18/17.
//  Copyright © 2017 David Pedroza. All rights reserved.
//

import Foundation
import UIKit

class RemoveMealController {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    func show(_ meal: Meal, handler:@escaping (UIAlertAction) -> Void) {
        
        let details = UIAlertController(title: meal.name, message: meal.details(), preferredStyle: UIAlertControllerStyle.alert)
        
        let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
        
        details.addAction(ok)
        
        let remove = UIAlertAction(title: "Remove", style: UIAlertActionStyle.destructive, handler: handler)
        
        details.addAction(remove)
        
        controller.present(details, animated: true, completion: nil)
        
    }
}
