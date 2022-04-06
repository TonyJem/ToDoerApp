import UIKit

class TopTabPanelView: UIStackView {
    
    private let model = TopTabModel()
    
    private var tabViews: [TopTab] = []
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        axis  = NSLayoutConstraint.Axis.horizontal
        spacing = -1 * Constants.BottomTabPanel.tabApposition
        distribution = UIStackView.Distribution.fillEqually
        translatesAutoresizingMaskIntoConstraints = false
        
        setupTabs()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupTabs() {
        for (index, tab) in model.tabs().enumerated() {
            let tabView = TopTab(frame: .zero, tab: tab, index: index)
            addArrangedSubview(tabView)
            tabViews.append(tabView)
        }
    }
}
