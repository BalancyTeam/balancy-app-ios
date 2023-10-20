import UIKit

class AuthViewController: UIViewController {
     
     // MARK: - UI Components
     private let headerView = AuthHeaderView(title: "З поверненням!", subTitle: "Раді знову тебе бачити")
     
     // MARK: - LifeCycle
     
     
     override func viewDidLoad() {
         super.viewDidLoad()
         self.setupUI()
     }
     
     // MARK: - UI Setup
     private func setupUI() {
         self.view.addSubview(headerView)
         headerView.translatesAutoresizingMaskIntoConstraints = false
         
         
         NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 270)
         ])
     }

}
