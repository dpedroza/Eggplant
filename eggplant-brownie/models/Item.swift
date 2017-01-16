import Foundation

class Item: Equatable {
    
    var name:String
    var calories:Double
    
    init(name:String, calories:Double) {
        self.name = name
        self.calories = calories
    }
    
}

func ==(firstItem: Item, secondItem:Item) -> Bool {
    return firstItem.name == secondItem.name && firstItem.calories == secondItem.calories
}
