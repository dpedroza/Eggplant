import Foundation

class MealsDao {
    
    let mealsFilePath: String

    // Dir mealsFilePath is setted at init
    
    init() {
        let userDirs = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let dir = userDirs[0]
        mealsFilePath = "\(dir)/eggplant-brownie-meals.data"
    }
    
    // Save meals list at the user directory
    
    func save(_ meal: Array<Meal>) {
        NSKeyedArchiver.archiveRootObject(meal, toFile: mealsFilePath)
    }
    
    // Load meals list from user directory
    
    func load() -> Array<Meal> {
        return NSKeyedUnarchiver.unarchiveObject(withFile: mealsFilePath) as! Array<Meal>
    }
    
}
