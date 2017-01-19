import Foundation

class ItemsDao {
    
    let itemsFilePath: String

    // Dir itemsFilePath is setted at init
    
    init() {
        
        let userDirs = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let dir = userDirs[0]
        itemsFilePath = "\(dir)/eggplant-brownie-items.data"
        
    }
    
    // Save items list at the user directory
    
    func save(_ items: Array<Item>) {
        NSKeyedArchiver.archiveRootObject(items, toFile: itemsFilePath)
    }
    
    // Load meals list from user directory
    
    func load() -> Array<Item> {
        return NSKeyedUnarchiver.unarchiveObject(withFile: itemsFilePath) as! Array<Item>
    }
    
}
