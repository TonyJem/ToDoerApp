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
        
        let W = size.width
        let H = tabModel.isActive ? size.height : size.height - 5
        
        let k: CGFloat = Constants.TabShape.sideAlignmentProportion
        let R: CGFloat = Constants.TabShape.tabCornerRadius
        let Pi = CGFloat.pi
        
        let Ax: CGFloat = .zero
        let Ay: CGFloat = .zero
        
        let Ox = Ax + 0.5 * W
        let Oy = Ay
        
        let Bx = Ox + 0.5 * W
        let By = Oy
        
        let alfa = atan(k)
        let beta = 0.5 * Pi - alfa
        
        let EF = R * tan(0.5 * beta)
        let FG = k * H
        let EG = EF + FG
        
        let C1x = Ox + 0.5 * W - FG - EF
        let C1y = Oy + H - R
        
        let OB = Bx - Ox
        let OC1x = OB - EG
        
        let C2x = Ox - OC1x
        let C2y = C1y
        
        let A = CGPoint(x: Ax , y: Ay)
        let B = CGPoint(x: Bx , y: By)
        let C1 = CGPoint(x: C1x , y: C1y)
        let C2 = CGPoint(x: C2x , y: C2y)
        
        let path = UIBezierPath()
        
        path.move(to: A)
        
        path.addLine(to: B)
        
        path.addArc(withCenter: C1,
                    radius: R,
                    startAngle: alfa,
                    endAngle: 0.5 * Pi,
                    clockwise: true)
        
        path.addArc(withCenter: C2,
                    radius: R,
                    startAngle: 0.5 * Pi,
                    endAngle: Pi - alfa,
                    clockwise: true)
        
        path.close()
        
        tabModel.backgroundColor.set()
        path.fill()
    }
}
