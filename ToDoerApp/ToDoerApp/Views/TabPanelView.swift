import UIKit

class TabPanelView: UIView {
    
    var model = tabModel()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
        let averageTabWidth = (panelWidth - tabApposition) / CGFloat(model.tabCount) + tabApposition
        let defaultTabWidth = Constants.BottomTabPanel.defaultTabWidth
        let tabWidth = min(averageTabWidth, defaultTabWidth)
        
        var tabIndex = 0
        var x: CGFloat = .zero
        repeat {
            let frame: CGRect = CGRect(x: x,
                                       y: .zero,
                                       width: tabWidth,
                                       height: Constants.BottomTabPanel.height)
            let tab = model.fetchTab(by: tabIndex)
            let tabView = BottomTab(frame: frame, tab: tab, index: tabIndex)
            tabView.bottomTabDelegate = self
            
            addSubview(tabView)
            
            tabIndex += 1
            x = x + tabWidth - tabApposition
        } while tabIndex < model.tabCount
    }
}

// MARK: - BottomTab Delegate
extension TabPanelView: BottomTabDelegate {
    func tabDidSelect(index: Int) {
        print("🟢 tabDidTap BottomTabDelegate in TabPanelView \(index)")
    }
}
