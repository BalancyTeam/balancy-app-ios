import Foundation
import UIKit

final class CustomTabBarViewController : UITabBarController, UITabBarControllerDelegate {
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.selectedIndex = 0
        setupMiddleButton()
    }
    func setupMiddleButton(){
        let middleButton = UIButton(frame: CGRect(x: (self.view.bounds.width/2)-25, y: -20, width: 60, height: 60))
        middleButton.setBackgroundImage(UIImage(named: "tabBarIcon"), for: .normal)
        middleButton.layer.shadowColor = UIColor.black.cgColor
        middleButton.layer.shadowOpacity = 0.1
        middleButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        
        self.tabBar.addSubview(middleButton)
        middleButton.addTarget(self, action: #selector(menuButtonAction) , for: .touchUpInside)
        self.view.layoutIfNeeded()
    }
    
    @objc func menuButtonAction(sender: UIButton){
        self.selectedIndex = 1
    }
}
