//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by David Pedroza on 1/12/17.
//  Copyright © 2017 David Pedroza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nameField:UITextField?
    @IBOutlet var happinessField:UITextField?
    var delegate: ViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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
            
        let meal = Meal(name: name, happiness: happiness)
        print("eaten \(meal.name) with happiness \(meal.happiness)")
            
            if (delegate == nil) {
                return
            }
            
            delegate?.add(meal)
            
            if let navigation = navigationController {
                    navigation.popViewController(animated: true)
            }
            
        }
        
    }


}

