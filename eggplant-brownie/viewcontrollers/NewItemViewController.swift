import UIKit

class NewItemViewController: UIViewController {
    
    // View fields
    
    @IBOutlet var nameTextField: UITextField?
    @IBOutlet var caloriesTextField: UITextField?
    
    var delegate: AddItemDelegate?
    
    // Init has a delegate self reference
    
    init(delegate: AddItemDelegate) {
        super.init(nibName: "NewItemViewController", bundle: nil)
        self.delegate = delegate
    }
    
    // Required initializer
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // Add a item to tableview and navigate to that view
    
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
