import UIKit

class TabPanelView: UIView {
    
    private let model = tabModel()
    private let tabApposition = Constants.BottomTabPanel.tabApposition
    
    private var tabViews: [BottomTab] = []
    private var recentlySelectedTabIndex: Int = 0
    
    private var tabWidth: CGFloat {
        let panelWidth = Constants.BottomTabPanel.width
        let averageTabWidth = (panelWidth - tabApposition) / CGFloat(model.tabs().count) + tabApposition
        let defaultTabWidth = Constants.BottomTabPanel.defaultTabWidth
        let tabWidth = min(averageTabWidth, defaultTabWidth)
        return tabWidth
    }
    
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
        var x: CGFloat = .zero
        for (index, tab) in model.tabs().enumerated() {
            let frame: CGRect = CGRect(x: x,
                                       y: .zero,
                                       width: tabWidth,
                                       height: Constants.BottomTabPanel.height)
            let tabView = BottomTab(frame: frame, tab: tab, index: index)
            tabView.bottomTabDelegate = self
            x = x + tabWidth - tabApposition
            addSubview(tabView)
            tabViews.append(tabView)
        }
    }
}

// MARK: - BottomTab Delegate
extension TabPanelView: BottomTabDelegate {
    func tabDidSelect(index: Int) {
        print("🟢 tabDidTap BottomTabDelegate in TabPanelView \(index)")
        
        guard index != recentlySelectedTabIndex else { return }
        
        model.activateTab(by: index)
        tabViews[index].tab = model.tabs()[index]
        
        model.deactivateTabBy(by: recentlySelectedTabIndex)
        tabViews[recentlySelectedTabIndex].tab = model.tabs()[recentlySelectedTabIndex]

        recentlySelectedTabIndex = index
    }
}
