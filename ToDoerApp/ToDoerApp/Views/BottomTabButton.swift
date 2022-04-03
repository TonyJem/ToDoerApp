import UIKit

class BottomTabButton: UIButton {
    
    var tabModel = Tab(title: "JAN", defaultColor: .green)
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        setTitle(tabModel.title, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(bottomTabButtonDidTap), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - Actions
    @objc private func bottomTabButtonDidTap() {
        tabModel.isActive = !tabModel.isActive
        reloadTabLayer()
    }
    
    // MARK: - Public Methods
    func reloadTabLayer() {
        layer.setNeedsDisplay()
        layer.displayIfNeeded()
    }
}

// MARK: - Draw shape of Trapezium with rounded corners
extension BottomTabButton {
    override func draw(_ rect: CGRect) {
        let size = self.bounds.size
        
        let tabWidth = size.width
        let tabHeight = tabModel.isActive ? size.height : size.height - 5
        
        let k: CGFloat = Constants.TabShape.sideAlignmentProportion
        let radius: CGFloat = Constants.TabShape.tabCornerRadius
        
        let Ax: CGFloat = .zero
        let Ay: CGFloat = .zero
        
        let Ox = Ax + 0.5 * tabWidth
        let Oy = Ay
        
        let Bx = Ox + 0.5 * tabWidth
        let By = Oy
        
        let alfa = atan(k)
        let beta = 0.5 * CGFloat.pi - alfa
        
        let EF = radius * tan(0.5 * beta)
        let FG = k * tabHeight
        let EG = EF + FG
        
        let C1x = Ox + 0.5 * tabWidth - FG - EF
        let C1y = Oy + tabHeight - radius
        
        let OB = Bx - Ox
        let OC1x = OB - EG
        
        let C2x = Ox - OC1x
        let C2y = C1y
        
        let pointA = CGPoint(x: Ax , y: Ay)
        let pointB = CGPoint(x: Bx , y: By)
        let rightCenterPoint = CGPoint(x: C1x , y: C1y)
        let leftCenterPoint = CGPoint(x: C2x , y: C2y)
        
        let path = UIBezierPath()
        path.move(to: pointA)
        path.addLine(to: pointB)
        
        path.addArc(withCenter: rightCenterPoint,
                    radius: radius,
                    startAngle: alfa,
                    endAngle: 0.5 * CGFloat.pi,
                    clockwise: true)
        
        path.addArc(withCenter: leftCenterPoint,
                    radius: radius,
                    startAngle: 0.5 * CGFloat.pi,
                    endAngle: CGFloat.pi - alfa,
                    clockwise: true)
        
        path.close()
        
        tabModel.backgroundColor.set()
        path.fill()
    }
}
