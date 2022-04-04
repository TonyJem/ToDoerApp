import UIKit

class TabPanelView: UIView {
    
    private let bottomTab = BottomTab()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemPink
        translatesAutoresizingMaskIntoConstraints = false
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        
        bottomTab.frame = CGRect(x: 0,
                                 y: 0,
                                 width: Constants.TabPanel.defaultTabWidth,
                                 height: Constants.TabPanel.height)
        addSubview(bottomTab)
    }
}
