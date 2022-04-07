import UIKit

struct Tab {
    let title: String
    let defaultColor: UIColor
    private let activeColor: UIColor = .activeTabBackround
    
    var isActive: Bool = false
    
    var backgroundColor: UIColor {
        isActive ? activeColor : defaultColor
    }
}

class TabModel {
    
    var activeTabIndex = 0
    
    var tabsDB: [Tab] = []
    
    func tabs() -> [Tab] {
        tabsDB
    }
    
    func activateTab(by index: Int) {
        tabsDB[activeTabIndex].isActive = false
        tabsDB[index].isActive = true
        activeTabIndex = index
    }
}
