import UIKit

class MainViewCell: UICollectionViewCell {
    
    static let identifier = "MainViewCellIdentifier"
    
    // MARK: - Views
    private let testView: UIView = {
        let view = UIView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupBackground(color: UIColor) {
        testView.backgroundColor = color
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        addSubview(testView)
    }
}

// MARK: - SetConstraints
extension MainViewCell {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            testView.leftAnchor.constraint(equalTo: leftAnchor),
            testView.topAnchor.constraint(equalTo: topAnchor),
            testView.trailingAnchor.constraint(equalTo: trailingAnchor),
            testView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
