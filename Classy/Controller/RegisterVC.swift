//
//  RegisterVC.swift
//  Classy
//
//  Created by Ali Alateiyah on 03/08/2019.
//  Copyright © 2019 Ali Alateiyah. All rights reserved.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {
	
	// Components
	// - Containers
	@IBOutlet weak var usernameContainer: UIView!
	@IBOutlet weak var emailContrainer: UIView!
	@IBOutlet weak var passwordContainer: UIView!
	
	// - Lines
	@IBOutlet weak var usernameLine: UIView!
	@IBOutlet weak var emailLine: UIView!
	@IBOutlet weak var passwordLine: UIView!
	
	// - TextFields
	@IBOutlet weak var usernameTextField: UITextField!
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordTextField: TextField!
	
	// - Misc.
	@IBOutlet weak var activityIndicator: UIActivityIndicatorView!
	var alert: UIAlertController?
	
	override func viewWillAppear(_ animated: Bool) {
		activityIndicator.stopAnimating()
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		customizeViews()
    }
	
	func customizeViews() {
		
		for textfield in [usernameTextField, emailTextField, passwordTextField] {
			textfield?.addTarget(self, action: #selector(userIsTyping(_:)), for: .editingChanged)
		}
		
		let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
		view.addGestureRecognizer(tap)

		for container in [usernameContainer, emailContrainer, passwordContainer] {
			container?.layer.cornerRadius = 5
			container?.layer.masksToBounds = true
			container?.dropShadow(shadowRadius: 4.0, shadowOpacity: 1.0, shadowOffset: .zero, shadowColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.08))
		}

		for line in [usernameLine, emailLine, passwordLine] {
			line?.layer.cornerRadius = 1
			line?.layer.masksToBounds = true
		}
		
		passwordTextField.Button.isEnabled = false
		passwordTextField.setButton(title: "Register", color: #colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.768627451, alpha: 1))
		passwordTextField.Button.addTarget(nil, action: #selector(registerButtonPressed), for: .touchUpInside)
	}
	
	@objc func registerButtonPressed() {
		activityIndicator.startAnimating()
		if let email = emailTextField.text, let password = passwordTextField.text {
			Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
				if let user = authResult?.user {
					let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
					changeRequest?.displayName = self.usernameTextField.text
					changeRequest?.commitChanges(completion: { (error) in
						if error == nil {
							print("\(String(describing: user.displayName!)) (\(String(describing: user.email!)))")
						}
					})
				} else {
					self.alert = UIAlertController(title: "Oops!", message: error!.localizedDescription, preferredStyle: .alert)
					self.present(self.alert!, animated: false, completion: {
						self.alert!.view.superview?.isUserInteractionEnabled = true
						self.alert!.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissAlertController)))
					})
					print(error!.localizedDescription)
				}
				self.activityIndicator.stopAnimating()
			}
		}
		
	}
	
	@objc func dismissAlertController() {
		self.alert?.dismiss(animated: false, completion: nil)
	}
	
	@objc func dismissKeyboard() {
		view.endEditing(true)
	}

	@objc func userIsTyping(_ sender: UITextField) {
		
		switch sender.tag {
		case 1: usernameLine.backgroundColor = usernameTextField.text!.count > 0 ? .black : #colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.768627451, alpha: 1)
		case 2: emailLine.backgroundColor = emailTextField.text!.count > 0 ? .black : #colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.768627451, alpha: 1)
		case 3:
			if passwordTextField.text!.count > 0 {
				passwordTextField.Button.isEnabled = true
				passwordLine.backgroundColor = .black
				passwordTextField.setButton(title: "Register", color: .black)
				
			} else {
				passwordLine.backgroundColor = #colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.768627451, alpha: 1)
				passwordTextField.setButton(title: "Register", color: #colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.768627451, alpha: 1))
				passwordTextField.Button.isEnabled = false
			}
		default: return
		}

	}
	
	@IBAction func alreadyRegisteredButtonPressed(_ sender: UIButton) {
		let loginVC = LoginVC()
		loginVC.modalPresentationStyle = .overFullScreen
		self.present(loginVC, animated: false, completion: nil)
	}
	
	@IBAction func resetPasswordButtonPressed(_ sender: UIButton) {
	}
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
