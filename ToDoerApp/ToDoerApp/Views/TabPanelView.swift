import UIKit

class TabPanelView: UIView {
    
    private let tabs: [Tab] = [
        Tab(id: 0, title: "JAN", defaultColor: .tabBackroundMonth01),
        Tab(id: 1, title: "FEB", defaultColor: .tabBackroundMonth02),
        Tab(id: 2, title: "MAR", defaultColor: .tabBackroundMonth03),
        Tab(id: 3, title: "APR", defaultColor: .tabBackroundMonth04),
        Tab(id: 4, title: "MAY", defaultColor: .tabBackroundMonth05),
        Tab(id: 5, title: "JUN", defaultColor: .tabBackroundMonth06),
        Tab(id: 6, title: "JUL", defaultColor: .tabBackroundMonth07),
        Tab(id: 7, title: "AUG", defaultColor: .tabBackroundMonth08),
        Tab(id: 8, title: "SEP", defaultColor: .tabBackroundMonth09),
        Tab(id: 9, title: "OCT", defaultColor: .tabBackroundMonth10),
        Tab(id: 10, title: "NOV", defaultColor: .tabBackroundMonth11),
        Tab(id: 11, title: "DEC", defaultColor: .tabBackroundMonth12)
    ]
    
    private var activeTab = 0
    
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
        let averageTabWidth = (panelWidth - tabApposition) / CGFloat(tabs.count) + tabApposition
        let defaultTabWidth = Constants.BottomTabPanel.defaultTabWidth
        let tabWidth = min(averageTabWidth, defaultTabWidth)
        
        var tabIndex = 0
        var x: CGFloat = .zero
        repeat {
            let frame: CGRect = CGRect(x: x,
                                       y: .zero,
                                       width: tabWidth,
                                       height: Constants.BottomTabPanel.height)
            let tab = BottomTab(frame: frame, tab: tabs[tabIndex])
            tab.bottomTabDelegate = self
            
            addSubview(tab)
            
            tabIndex += 1
            x = x + tabWidth - tabApposition
        } while tabIndex < tabs.count
    }
}

// MARK: - BottomTab Delegate
extension TabPanelView: BottomTabDelegate {
    func tabDidSelect(id: Int) {
        print("🟢 tabDidTap BottomTabDelegate in TabPanelView \(id)")
    }
}
