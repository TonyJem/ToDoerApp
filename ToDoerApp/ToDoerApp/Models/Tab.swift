import Foundation
import UIKit

struct Tab {
    let id: Int
    let title: String
    let defaultColor: UIColor
    let activeColor: UIColor = .white
    
    var isActive: Bool = false
    
    var backgroundColor: UIColor {
        isActive ? activeColor : defaultColor
    }
}
