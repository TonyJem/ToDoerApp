import UIKit

class TabPanelView: UIView {
    
    private let bottomTab1 = BottomTab()
    private let bottomTab2 = BottomTab()
    
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
        addSubview(bottomTab1)
        addSubview(bottomTab2)
    }
}

// MARK: - SetConstraints
extension TabPanelView {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            bottomTab1.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomTab1.topAnchor.constraint(equalTo: topAnchor),
            bottomTab1.widthAnchor.constraint(equalToConstant: 100),
            bottomTab1.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            bottomTab2.leadingAnchor.constraint(equalTo: bottomTab1.trailingAnchor,
                                                       constant: -7),
            bottomTab2.topAnchor.constraint(equalTo: topAnchor),
            bottomTab2.widthAnchor.constraint(equalToConstant: 100),
            bottomTab2.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
}
