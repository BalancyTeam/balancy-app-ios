import UIKit

extension UIView {
    func addSubview(_ childView: UIView, applyConstraints: Bool = false) {
        childView.translatesAutoresizingMaskIntoConstraints = applyConstraints
        self.addSubview(childView)
    }
    
    func addSubviews(_ childViews: UIView...,  applyConstraints: Bool = false) {
        childViews.forEach { child in
            addSubview(child, applyConstraints: applyConstraints)
        }
    }
    
    func setShadow(radius: CGFloat, color: UIColor, opacity: Float, offset: CGSize = CGSize(width: 0, height: 0)) {
        layer.shadowColor =  color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shadowOffset = offset
    }
    
    func setCornerRadius(_ radius: CGFloat) {
        layer.cornerRadius = radius
    }
}
