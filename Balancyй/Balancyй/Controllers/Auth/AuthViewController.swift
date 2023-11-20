import UIKit

final class AuthViewController: UIViewController {
     
     // MARK: - UI Components
    private let headerView = AuthHeaderView(title: "З поверненням!", subTitle: "Раді знову тебе бачити")
    private let usernameField = CustomTextField(authFieldType: .username)

    // MARK: - LifeCycle
     
     override func viewDidLoad() {
         super.viewDidLoad()
         self.setupUI()
     }
   
     
     // MARK: - UI Setup
     private func setupUI() {

         self.view.backgroundColor = #colorLiteral(red: 0.18, green: 0.18, blue: 0.18, alpha: 0.4)
         
         self.view.addSubview(headerView)
         self.view.addSubview(usernameField)

         headerView.translatesAutoresizingMaskIntoConstraints = false
         usernameField.translatesAutoresizingMaskIntoConstraints = false
         
         NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.bottomAnchor.constraint(equalTo: self.view.centerYAnchor),
            
            self.usernameField.topAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 12),
            self.usernameField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.usernameField.heightAnchor.constraint(equalToConstant: 55),
            self.usernameField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85)
         ])
     }
}
