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
        let tabs = model.fetchAllTabs()
        let panelWidth = Constants.BottomTabPanel.width
        let tabApposition = Constants.BottomTabPanel.tabApposition
        let averageTabWidth = (panelWidth - tabApposition) / CGFloat(tabs.count) + tabApposition
        let defaultTabWidth = Constants.BottomTabPanel.defaultTabWidth
        let tabWidth = min(averageTabWidth, defaultTabWidth)
        
        var x: CGFloat = .zero
        for (index, tab) in tabs.enumerated() {
            
            let frame: CGRect = CGRect(x: x,
                                       y: .zero,
                                       width: tabWidth,
                                       height: Constants.BottomTabPanel.height)
            
            let tabView = BottomTab(frame: frame, tab: tab, index: index)
            tabView.bottomTabDelegate = self
            x = x + tabWidth - tabApposition
            addSubview(tabView)
        }
    }
}

// MARK: - BottomTab Delegate
extension TabPanelView: BottomTabDelegate {
    func tabDidSelect(index: Int) {
        print("🟢 tabDidTap BottomTabDelegate in TabPanelView \(index)")
    }
}
