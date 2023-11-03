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
   
    // MARK: - Not sure if I will need this piece of code yet
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//        self.navigationController?.navigationBar.isHidden = true
//    }
     
     // MARK: - UI Setup
     private func setupUI() {

         self.view.backgroundColor = UIColor(named: "#121212")
         
         self.view.addSubview(headerView)
         self.view.addSubview(usernameField)

         headerView.translatesAutoresizingMaskIntoConstraints = false
         usernameField.translatesAutoresizingMaskIntoConstraints = false
         
         NSLayoutConstraint.activate([
            self.headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 270),
            
            self.usernameField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12),
            self.usernameField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.usernameField.heightAnchor.constraint(equalToConstant: 55),
            self.usernameField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85)
         ])
         
         // MARK: - Debug lines (will be removed)
//         self.headerView.backgroundColor = .systemPink
//         self.usernameField.backgroundColor = .systemPurple
     }

}
