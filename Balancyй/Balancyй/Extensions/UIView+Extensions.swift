import UIKit
import SwiftUI

extension UIView {
    func addSubview(_ childView: UIView, applyConstraints: Bool = false) {
        childView.translatesAutoresizingMaskIntoConstraints = applyConstraints
        self.addSubview(childView)
    }
    
    func addSubviews(_ childViews: UIView..., applyConstraints: Bool = false) {
        childViews.forEach { child in
            addSubview(child, applyConstraints: applyConstraints)
        }
    }
    
    func setShadow(radius: CGFloat, color: UIColor, opacity: Float, offset: CGSize = CGSize(width: 0, height: 0)) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shadowOffset = offset
    }
    
    func setCornerRadius(_ radius: CGFloat) {
        layer.cornerRadius = radius
    }
}

extension UIView {
    func mapButton(_ button: UIButton, for event: UIControl.Event = .touchUpInside, action: @escaping () -> Void) {
        let uiAction = UIAction(handler: { _ in
            action()
        })
        button.addAction(uiAction, for: event)
    }
}

//MARK: - Preview Logic
extension UIView {
    var preview: some View {
        Preview(view: self)
    }
    
    private struct Preview: UIViewRepresentable {
        let view: UIView
        
        func makeUIView(context: Context) -> UIView {
            view
        }
        
        func updateUIView(_ uiView: UIView, context: Context) {
        }
    }
}
