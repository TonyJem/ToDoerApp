import UIKit

class TabPanelView: UIView {
    
    private let tabs: [Tab] = [
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
            let tab = BottomTab(frame: frame, tabModel: tabs[tabIndex])
            
            addSubview(tab)
            tabIndex += 1
            x = x + tabWidth - tabApposition
        } while tabIndex < tabs.count
    }
}
