import UIKit

class TabPanelView: UIView {
    
    private let tabCount = 12
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemPink
        translatesAutoresizingMaskIntoConstraints = false
        
        setupTabs()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Private Methods
    private func setupTabs() {
        
        let panelWidth = Constants.BottomTabPanel.width
        let tabApposition = Constants.BottomTabPanel.tabApposition
        let averageTabWidth = (panelWidth - tabApposition) / CGFloat(tabCount) + tabApposition
        let defaultTabWidth = Constants.BottomTabPanel.defaultTabWidth
        let tabWidth = min(averageTabWidth, defaultTabWidth)
        
        var tabIndex = 0
        var x: CGFloat = .zero
        repeat {
            let tab = BottomTab()
            tab.frame = CGRect(x: x,
                               y: .zero,
                               width: tabWidth,
                               height: Constants.BottomTabPanel.height)
            addSubview(tab)
            tabIndex += 1
            x = x + tabWidth - tabApposition
        } while tabIndex < tabCount
        
    }
}
