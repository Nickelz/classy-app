//
//  AuthService.swift
//  Classy
//
//  Created by Ali Alateiyah on 03/08/2019.
//  Copyright © 2019 Ali Alateiyah. All rights reserved.
//

import UIKit
import FirebaseAuth

class AuthService {
	
	static let instance = AuthService()
	
	let defaults = UserDefaults.standard
	
	var isLoggedIn: Bool {
		get {
			return defaults.bool(forKey: LOGGED_IN_KEY)
		}
		
		set {
			defaults.set(newValue, forKey: LOGGED_IN_KEY)
		}
	}
	
	func createUser(email: String, password: String, completion: @escaping (_ success: Bool) -> Void) {
		Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
			if let user = result?.user {
				print(user)
				completion(true)
			} else {
				completion(false)
			}
		}
	}
	
	//TODO: Login function
	
}
