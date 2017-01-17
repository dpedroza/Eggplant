//
//  Alert.swift
//  eggplant-brownie
//
//  Created by David Pedroza on 1/17/17.
//  Copyright © 2017 David Pedroza. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    
    let controller:UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func show(title:String = "Erro", message: String = "Erro desconhecido") {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let button = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
        
        alert.addAction(button)
        
        controller.present(alert, animated: true, completion: nil)
        
    }
}
