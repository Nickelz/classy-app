//
//  LoginVC.swift
//  Classy
//
//  Created by Ali Alateiyah on 03/08/2019.
//  Copyright © 2019 Ali Alateiyah. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController {

	// Components
	
	// - Containers
	@IBOutlet weak var emailContainer: UIView!
	@IBOutlet weak var passwordContainer: UIView!
	
	// - Lines
	@IBOutlet weak var emailLine: UIView!
	@IBOutlet weak var passwordLine: UIView!
	
	// - TextFields
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
		
		for textfield in [emailTextField, passwordTextField] {
			textfield?.addTarget(self, action: #selector(userIsTyping(_:)), for: .editingChanged)
		}
		
		let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
		view.addGestureRecognizer(tap)
		
		passwordTextField.Button.isEnabled = false
		passwordTextField.setButton(title: "Login", color: #colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.768627451, alpha: 1))
		passwordTextField.Button.addTarget(nil, action: #selector(loginButtonPressed), for: .touchUpInside)
		
		for container in [emailContainer, passwordContainer] {
			container?.layer.cornerRadius = 5
			container?.layer.masksToBounds = true
			container?.dropShadow(shadowRadius: 4.0, shadowOpacity: 1.0, shadowOffset: .zero, shadowColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.08))
		}
		
		for line in [emailLine, passwordLine] {
			line?.layer.cornerRadius = 1
			line?.layer.masksToBounds = true
		}
	}

	@objc func loginButtonPressed() {
		activityIndicator.startAnimating()
		if let email = emailTextField.text, let password = passwordTextField.text {
			Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
				guard self != nil else { return }
				if error == nil {
					self!.activityIndicator.stopAnimating()
				} else {
					self!.alert = UIAlertController(title: "Oops!", message: error!.localizedDescription, preferredStyle: .alert)
					self!.present(self!.alert!, animated: false, completion: {
						self!.alert!.view.superview?.isUserInteractionEnabled = true
						self!.alert!.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self!.dismissAlertController)))
					})
					print(error!.localizedDescription)
				}
				self!.activityIndicator.stopAnimating()
			}
		}
	}
	
	@objc func dismissAlertController() {
		self.alert?.dismiss(animated: false, completion: nil)
	}
	
	@objc func dismissKeyboard() {
		view.endEditing(true)
		print("Keyboard dismissed!")
	}
	
	@objc func userIsTyping(_ sender: UITextField) {
		
		switch sender.tag {
		case 1: emailLine.backgroundColor = emailTextField.text!.count > 0 ? .black : #colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.768627451, alpha: 1)
		case 2:
			if passwordTextField.text!.count > 0 {
				passwordTextField.Button.isEnabled = true
				passwordLine.backgroundColor = .black
				passwordTextField.setButton(title: "Login", color: .black)
				
			} else {
				passwordLine.backgroundColor = #colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.768627451, alpha: 1)
				passwordTextField.setButton(title: "Login", color: #colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.768627451, alpha: 1))
				passwordTextField.Button.isEnabled = false
			}
		default: return
		}

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
