import UIKit

struct Constants {
    enum Layout {
        static let screenHeight = UIScreen.main.bounds.height
        static let minimumLineSpacing: CGFloat = 0.0
        
        static private let headerHeightMultiplier: CGFloat = 0.075
        static let headerViewHeight = screenHeight * headerHeightMultiplier
        
        static private let footerHeightMultiplier: CGFloat = 0.04375
        static let footerViewHeight = screenHeight * footerHeightMultiplier
        
        static let dateViewWidthMultiplier: CGFloat = 0.25
        static let dateViewHeightMultiplier: CGFloat = 6/7
        
        static let horizontalInset: CGFloat = 20.0
        static let buttonHeight: CGFloat = 40.0
    }
}
