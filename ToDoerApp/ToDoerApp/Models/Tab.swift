import Foundation
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

class tabModel {
    
    private var tabsDB: [Tab] = [
        Tab(title: "JAN", defaultColor: .tabBackroundMonth01),
        Tab(title: "FEB", defaultColor: .tabBackroundMonth02),
        Tab(title: "MAR", defaultColor: .tabBackroundMonth03),
        Tab(title: "APR", defaultColor: .tabBackroundMonth04),
        Tab(title: "MAY", defaultColor: .tabBackroundMonth05),
        Tab(title: "JUN", defaultColor: .tabBackroundMonth06),
        Tab(title: "JUL", defaultColor: .tabBackroundMonth07),
        Tab(title: "AUG", defaultColor: .tabBackroundMonth08),
        Tab(title: "SEP", defaultColor: .tabBackroundMonth09),
        Tab(title: "OCT", defaultColor: .tabBackroundMonth10),
        Tab(title: "NOV", defaultColor: .tabBackroundMonth11),
        Tab(title: "DEC", defaultColor: .tabBackroundMonth12)
    ]
    
    func tabs() -> [Tab] {
        tabsDB
    }
    
    func activateTab(by index: Int) {
        tabsDB[index].isActive = true
    }
    
    func deactivateTabBy(by index: Int) {
        tabsDB[index].isActive = false
    }
}
