import Foundation
import UIKit

class Alert {
    
    // UIViewController controller reference
    
    let controller:UIViewController
    
    // Instantiate controller on init
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    // Shows a alert with title and message parameters and an ok button
    
    func show(title:String = "Erro", message: String = "Erro desconhecido") {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let button = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
        
        alert.addAction(button)
        
        controller.present(alert, animated: true, completion: nil)
        
    }
}
