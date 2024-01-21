import UIKit

extension UIViewController {
    func dismissPopup(completion: (() -> Void)? = nil) {
        self.dismiss(animated: true, completion: completion)
    }
    
    func mapButton(_ button: UIButton, action: Selector, for event: UIControl.Event = .touchUpInside) {
        button.addTarget(self, action: action, for: event)
    }
    
    func mapButton(_ button: UIButton, action: UIAction, for event: UIControl.Event = .touchUpInside) {
        button.addAction(action, for: event)
    }
    
    func mapButton(_ button: UIButton, for event: UIControl.Event = .touchUpInside, action: @escaping () -> Void) {
        let uiAction = UIAction(handler: { _ in
            action()
        })
        button.addAction(uiAction, for: event)
    }
}
