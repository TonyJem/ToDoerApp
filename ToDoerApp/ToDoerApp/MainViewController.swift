import UIKit

class MainViewController: UIViewController {
    
    enum LayoutConstants {
        static let headerHeightMultiplier: CGFloat = 0.075
        static let footerHeightMultiplier: CGFloat = 0.04375
    }
    
    // MARK: - Views
    private let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let footerView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        view.addSubview(headerView)
        view.addSubview(mainView)
        view.addSubview(footerView)
    }
}

// MARK: - SetConstraints
extension MainViewController {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            headerView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            headerView.heightAnchor.constraint(equalTo: view.heightAnchor,
                                               multiplier: LayoutConstants.headerHeightMultiplier)
        ])
        
        NSLayoutConstraint.activate([
            footerView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            footerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            footerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            footerView.heightAnchor.constraint(equalTo: view.heightAnchor,
                                               multiplier: LayoutConstants.footerHeightMultiplier)
        ])
        
        NSLayoutConstraint.activate([
            mainView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            mainView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: footerView.topAnchor)
        ])
    }
}
