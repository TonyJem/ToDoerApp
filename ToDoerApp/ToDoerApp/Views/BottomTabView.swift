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
        let p3 = CGPoint(x: p2.x - a , y: p2.y + h)
        let p4 = CGPoint(x: p1.x + a, y: p3.y)
        
        // create the path
        let path = UIBezierPath()
        path.move(to: p1)
        path.addLine(to: p2)
        path.addLine(to: p3)
        path.addLine(to: p4)
        path.close()
        
        // fill the path
        color.set()
        path.fill()
    }
}
