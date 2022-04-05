import UIKit

class TopTabPanelView: UIStackView {
    
    let tabView0: TopTab = {
        let tab = TopTab(frame: .zero, tab: Tab(title: "Day", defaultColor: .tabDayBackround), index: 1)
        
        tab.translatesAutoresizingMaskIntoConstraints = false
        return tab
    }()
    
    let tabView1: TopTab = {
        let tab = TopTab(frame: .zero, tab: Tab(title: "Week", defaultColor: .tabWeekBackround), index: 1)
        
        tab.translatesAutoresizingMaskIntoConstraints = false
        return tab
    }()
    
    let tabView2: TopTab = {
        let tab = TopTab(frame: .zero, tab: Tab(title: "Month", defaultColor: .tabMonthBackround), index: 1)
        
        tab.translatesAutoresizingMaskIntoConstraints = false
        return tab
    }()
    
    let tabView3: TopTab = {
        let tab = TopTab(frame: .zero, tab: Tab(title: "Tasks", defaultColor: .tabTasksBackround), index: 1)
        
        tab.translatesAutoresizingMaskIntoConstraints = false
        return tab
    }()
    
    let tabView4: TopTab = {
        let tab = TopTab(frame: .zero, tab: Tab(title: "Notes", defaultColor: .tabNotesBackround), index: 1)
        
        tab.translatesAutoresizingMaskIntoConstraints = false
        return tab
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        spacing = -7
        axis  = NSLayoutConstraint.Axis.horizontal
        distribution = UIStackView.Distribution.fillEqually
        translatesAutoresizingMaskIntoConstraints = false
        
        setupTabs()
        setConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupTabs() {
        addArrangedSubview(tabView0)
        addArrangedSubview(tabView1)
        addArrangedSubview(tabView2)
        addArrangedSubview(tabView3)
        addArrangedSubview(tabView4)
    }
}

// MARK: - SetConstraints
extension TopTabPanelView {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            tabView0.heightAnchor.constraint(equalToConstant: Constants.TopTabPanel.height)
        ])
        
        NSLayoutConstraint.activate([
            tabView1.heightAnchor.constraint(equalToConstant: Constants.TopTabPanel.height)
        ])
        
        NSLayoutConstraint.activate([
            tabView2.heightAnchor.constraint(equalToConstant: Constants.TopTabPanel.height)
        ])
        
        NSLayoutConstraint.activate([
            tabView3.heightAnchor.constraint(equalToConstant: Constants.TopTabPanel.height)
        ])
        
        NSLayoutConstraint.activate([
            tabView4.heightAnchor.constraint(equalToConstant: Constants.TopTabPanel.height)
        ])
    }
}
