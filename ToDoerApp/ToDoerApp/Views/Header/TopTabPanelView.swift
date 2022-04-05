import UIKit

class TopTabPanelView: UIView {
    
    let tabView: TopTab = {
        let tab = TopTab(frame: .zero, tab: Tab(title: "Day", defaultColor: .tabDayBackround), index: 1)
        
        tab.translatesAutoresizingMaskIntoConstraints = false
        return tab
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .green
        translatesAutoresizingMaskIntoConstraints = false
        
        setupTabs()
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Private Methods
    private func setupTabs() {
        addSubview(tabView)
    }
}

// MARK: - SetConstraints
extension TopTabPanelView {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            tabView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tabView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tabView.widthAnchor.constraint(equalToConstant: 100),
            tabView.heightAnchor.constraint(equalToConstant: Constants.TopTabPanel.height)
        ])
        
    }
}
