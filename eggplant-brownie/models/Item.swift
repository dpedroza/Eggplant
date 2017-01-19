import Foundation

class Item: NSObject, NSCoding {
    
    var name:String
    var calories:Double
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(calories, forKey: "calories")
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        calories = aDecoder.decodeDouble(forKey: "calories")
    }
    
    init(name:String, calories:Double) {
        self.name = name
        self.calories = calories
    }
    
}

func ==(firstItem: Item, secondItem:Item) -> Bool {
    return firstItem.name == secondItem.name && firstItem.calories == secondItem.calories
}
