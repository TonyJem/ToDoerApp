import UIKit

class HeaderView: UIView {
    
    // MARK: - Views
    private let tabPanelView = TabPanelView()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .gray
        translatesAutoresizingMaskIntoConstraints = false
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        addSubview(tabPanelView)
    }
}

// MARK: - SetConstraints
extension HeaderView {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            tabPanelView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                  constant: Constants.BottomTabPanel.horizontalInset),
            tabPanelView.topAnchor.constraint(equalTo: topAnchor),
            tabPanelView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                   constant: -1 * Constants.BottomTabPanel.horizontalInset),
            tabPanelView.heightAnchor.constraint(equalToConstant: Constants.BottomTabPanel.height)
        ])
        
    }
}
