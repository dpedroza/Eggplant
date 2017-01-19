import Foundation

class Meal : NSCoding {
    
    let name:String
    let happiness:Int
    let items:Array<Item>
    
    init(name:String, happiness:Int, items: Array<Item> = []) {
        self.name = name
        self.happiness = happiness
        self.items = items
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(happiness, forKey: "happiness")
        aCoder.encode(items, forKey: "items")
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        happiness = aDecoder.decodeInteger(forKey: "happiness")
        items = aDecoder.decodeObject(forKey: "items") as! Array
    }
    
    func allCalories() -> Double {
        
        var total = 0.0
        
        for item in items {
            total += item.calories
        }
        
        return total
    }
    
    func details() -> String {
        
        var message =  "Happiness: \(happiness)"
        
        for item in items {
            message += "\n \(item.name) Calories \(item.calories)"
        }
        
        return message
    }
    
}
