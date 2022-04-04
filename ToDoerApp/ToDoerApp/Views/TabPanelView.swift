import UIKit

class TabPanelView: UIView {
    
    private let bottomTabButton = BottomTabButton()
    private let bottomTabButton02 = BottomTabButton()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemPink
        translatesAutoresizingMaskIntoConstraints = false
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        addSubview(bottomTabButton)
        addSubview(bottomTabButton02)
    }
}

// MARK: - SetConstraints
extension TabPanelView {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            bottomTabButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomTabButton.topAnchor.constraint(equalTo: topAnchor),
            bottomTabButton.widthAnchor.constraint(equalToConstant: 100),
            bottomTabButton.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            bottomTabButton02.leadingAnchor.constraint(equalTo: bottomTabButton.trailingAnchor,
                                                       constant: -7),
            bottomTabButton02.topAnchor.constraint(equalTo: topAnchor),
            bottomTabButton02.widthAnchor.constraint(equalToConstant: 100),
            bottomTabButton02.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
}
