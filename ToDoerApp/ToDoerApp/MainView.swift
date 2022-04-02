import UIKit

class MainView: UIView {
    
    // MARK: - Views
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionVIew = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionVIew.backgroundColor = .white
        
        collectionVIew.translatesAutoresizingMaskIntoConstraints = false
        return collectionVIew
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
        setDelegates()
        
        collectionView.register(MainViewCell.self, forCellWithReuseIdentifier: MainViewCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupViews() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(collectionView)
    }
    
    private func setDelegates() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

// MARK: - CollectionView DataSource
extension MainView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 888
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainViewCell.identifier, for: indexPath) as! MainViewCell
        
        let color: UIColor = indexPath.row % 2 == 0 ? .red : .blue
        cell.setupBackground(color: color)
        
        return cell
    }
}

// MARK: - CollectionView Delegate
extension MainView: UICollectionViewDelegate {
    
}

// MARK: - SetConstraints
extension MainView {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
