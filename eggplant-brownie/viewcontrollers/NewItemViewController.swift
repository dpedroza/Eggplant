//
//  NewItemViewController.swift
//  eggplant-brownie
//
//  Created by David Pedroza on 1/16/17.
//  Copyright © 2017 David Pedroza. All rights reserved.
//

import UIKit

class NewItemViewController: UIViewController {
    
    @IBOutlet var nameTextField: UITextField?
    @IBOutlet var caloriesTextField: UITextField?
    
    var delegate: AddItemDelegate?
    
    init(delegate: AddItemDelegate) {
        super.init(nibName: "NewItemViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBAction func addNewItem() {
        
        let name = nameTextField?.text
        let calories = Double(caloriesTextField!.text!)
        
        if (name == nil || calories == nil || delegate == nil) {
            return
        }
        
        let item = Item(name: name!, calories: calories!)
        delegate?.add(item)
        
        if let navigation = navigationController  {
            navigation.popViewController(animated: true)
        }
    }

}
