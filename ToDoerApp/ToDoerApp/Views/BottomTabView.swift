import UIKit

class BottomTabView : UIView {
    
    let color: UIColor = .red
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        let size = self.bounds.size
        
        let w = size.width
        let h = size.height
        let k: CGFloat = 0.25
        let R: CGFloat = 10.0
        
        let Ax: CGFloat = .zero
        let Ay: CGFloat = .zero
        
        let Ox = Ax + 0.5 * w
        let Oy = Ay
        
        let Bx = Ox + 0.5 * w
        let By = Oy
        
        let alfa = atan(k)
        let beta = 0.5 * CGFloat.pi - alfa
        
        let EF = R * tan(0.5 * beta)
        let FG = k * h
        let EG = EF + FG
        
        let C1x = Ox + 0.5 * w - FG - EF
        let C1y = Oy + h - R
        
        let OB = Bx - Ox
        let OC1x = OB - EG
        
        let C2x = Ox - OC1x
        let C2y = C1y
        
        let pointA = CGPoint(x: Ax , y: Ay)
        let pointB = CGPoint(x: Bx , y: By)
        let pointC1 = CGPoint(x: C1x , y: C1y)
        let pointC2 = CGPoint(x: C2x , y: C2y)
        
        let path = UIBezierPath()
        path.move(to: pointA)
        path.addLine(to: pointB)
        path.addArc(withCenter: pointC1, radius: R, startAngle: alfa, endAngle: 0.5 * CGFloat.pi, clockwise: true)
        path.addArc(withCenter: pointC2, radius: R, startAngle: 0.5 * CGFloat.pi, endAngle: CGFloat.pi - alfa, clockwise: true)
        path.close()
        
        color.set()
        path.fill()
    }
}
