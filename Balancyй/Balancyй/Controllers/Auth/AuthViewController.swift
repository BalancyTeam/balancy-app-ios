import UIKit

final class AuthViewController: UIViewController {
     
     // MARK: - UI Components 
    private let headerView = AuthHeaderView(title: "З поверненням!", subTitle: "Раді знову тебе бачити")
    private let emailField = CustomTextField(fieldType: .email)
    private let passwordField = CustomTextField(fieldType: .password)

    // MARK: - LifeCycle
     
     override func viewDidLoad() {
         super.viewDidLoad()
         self.setupUI()
     }
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
     
     // MARK: - UI Setup
     private func setupUI() {
         self.view.backgroundColor = #colorLiteral(red: 0.18, green: 0.18, blue: 0.18, alpha: 0.4)

         self.view.addSubview(headerView)
         self.view.addSubview(emailField)
         self.view.addSubview(passwordField)
         

         
         headerView.translatesAutoresizingMaskIntoConstraints = false
         emailField.translatesAutoresizingMaskIntoConstraints = false
         passwordField.translatesAutoresizingMaskIntoConstraints = false

         NSLayoutConstraint.activate([
            
            self.headerView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.headerView.heightAnchor.constraint(equalToConstant: 370),

            self.emailField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 12),
            self.emailField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.emailField.heightAnchor.constraint(equalToConstant: 50),
            self.emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 22),
            self.passwordField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.passwordField.heightAnchor.constraint(equalToConstant: 50),
            self.passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85)
         ])
     }
}
