import UIKit

final class AuthViewController: UIViewController, UITextFieldDelegate {
     
     // MARK: - UI Components 
    private let headerView = AuthHeaderView(title: "З поверненням!", subTitle: "Раді знову тебе бачити")
    private let emailField = CustomTextField(fieldType: .email)
    private let passwordField = CustomTextField(fieldType: .password)
    private let signInButton = CustomButton(title: "Увійти", hasBackground: true, fontSize: .big)
    private let forgotPasswordButton = CustomButton(title: "Забули пароль?", fontSize: .medium)
    private let createAccountTextView = CustomTextView(normalText: "Ще не маєш облікового запису?", tappableText: "Створити")
    

    // MARK: - LifeCycle
     
     override func viewDidLoad() {
         super.viewDidLoad()
         self.setupUI()
         passwordField.enablePasswordToggle()
         
//         Set delegates for text fields
         emailField.delegate = self
         passwordField.delegate = self
     }
   
    // MARK: - UITextFieldDelegate
    // MARK: - STOPPED HERE

    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//            if let customTextField = textField as? CustomTextField {
//                customTextField.setBorderColor(.blue) // Change to desired color when editing begins
//            }
//        }
//        
//        func textFieldDidEndEditing(_ textField: UITextField) {
//            if let customTextField = textField as? CustomTextField {
//                customTextField.setBorderColor(.gray) // Change to desired color when editing ends
//            }
//        }
        

    
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
         self.view.addSubview(signInButton)
         self.view.addSubview(forgotPasswordButton)
         self.view.addSubview(createAccountTextView)
         

         
         headerView.translatesAutoresizingMaskIntoConstraints = false
         emailField.translatesAutoresizingMaskIntoConstraints = false
         passwordField.translatesAutoresizingMaskIntoConstraints = false
         signInButton.translatesAutoresizingMaskIntoConstraints = false
         forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
         createAccountTextView.translatesAutoresizingMaskIntoConstraints = false
         

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
            self.passwordField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.forgotPasswordButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 1),
            self.forgotPasswordButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -100),
            self.forgotPasswordButton.heightAnchor.constraint(equalToConstant: 40),
            self.forgotPasswordButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.signInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 80),
            self.signInButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            self.signInButton.heightAnchor.constraint(equalToConstant: 50),
            self.signInButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            self.createAccountTextView.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20),
            self.createAccountTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),
            self.createAccountTextView.heightAnchor.constraint(equalToConstant: 50),
            self.createAccountTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85)
         ])
     }
}
