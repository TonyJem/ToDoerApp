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
        
        var index = 0
        var x: CGFloat = 0.0
        
        let panelWidth = Constants.Layout.screenWidth - (2 * Constants.TabPanel.horizontalInset)
        
        let apposition = Constants.TabPanel.tabApposition
        
        print("🟢 panelWidth: \(panelWidth)")
        
        let averageW = ((panelWidth - CGFloat(tabCount - 1) * apposition) / CGFloat(tabCount))
        
        
//    width: Constants.TabPanel.defaultTabWidth
        
        repeat {
            let tab = BottomTab()
            tab.frame = CGRect(x: x,
                               y: 0,
                               width: averageW,
                               height: Constants.TabPanel.height)
            addSubview(tab)
            index = index + 1
            x = x + averageW - apposition
        } while index < tabCount
        
    }
}
