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
        let k: CGFloat = 0.15
        let a = k * h
        
        // calculate points coordintes
        let p1 = self.bounds.origin
        let p2 = CGPoint(x: p1.x + w, y: p1.y)
//        let p3 = CGPoint(x: p2.x - a , y: p2.y + h)
//        let p4 = CGPoint(x: p1.x + a, y: p3.y)
        
        
        // calculate My coordintes:
        
        let R: CGFloat = 10.0
        
        let alfa = atan(k)
        let beta = CGFloat.pi/2 - alfa
        
        
        let Bx = p2.x
        let By = p2.y
        
        let EH = R * tan(0.5 * beta)
        let Ex = Bx - a - EH
        let Ey = By + h
        
        let HD = EH
        let mh = HD * cos(alfa)
        let HG = HD * sin(alfa)
        
        let Dx = Bx - a - HG
        let Dy = Ey - mh
        
        let Cx = Ex
        let Cy = Ey - R
        
        let centerPoint = CGPoint(x: Cx-3 , y: Cy)
        
        let centerPoint2 = CGPoint(x: Cx-70 , y: Cy)
        
        let p3 = CGPoint(x: Dx , y: Dy)
        let p4 = CGPoint(x: Ex , y: Ey)
        let p5 = CGPoint(x: p1.x + a , y: Ey)
        
        // create the path
        let path = UIBezierPath()
        path.move(to: p1)
        path.addLine(to: p2)
//        path.addLine(to: p3)
        path.addArc(withCenter: centerPoint, radius: R, startAngle: alfa, endAngle: CGFloat.pi/2, clockwise: true)
        
        path.addArc(withCenter: centerPoint2, radius: R, startAngle: CGFloat.pi/2, endAngle: CGFloat.pi - alfa, clockwise: true)
//        path.addLine(to: p4)
//        path.addLine(to: p5)
        path.close()
        
        // fill the path
        color.set()
        path.fill()
    }
}
