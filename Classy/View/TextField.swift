//
//  TextField.swift
//  Classy
//
//  Created by Ali Alateiyah on 05/08/2019.
//  Copyright © 2019 Ali Alateiyah. All rights reserved.
//

import UIKit

class TextField: UITextField {
	
	var Button: UIButton!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		createUserInterface()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		createUserInterface()
	}
	
	func createUserInterface() {
		Button = {
			let button = UIButton(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
//			button.setTitle("Next", for: .normal)
			button.titleLabel?.font = UIFont(name: "MavenPro-Bold", size: 15)
			button.backgroundColor = #colorLiteral(red: 0.768627451, green: 0.768627451, blue: 0.768627451, alpha: 1)
			return button
		}()
		
		self.inputAccessoryView = Button
	}
	
	func setButton(title: String = "Done", color: UIColor = UIColor.black) {
		Button.setTitle(title, for: .normal)
		Button.titleLabel?.text = title
		Button.backgroundColor = color
	}
	
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

protocol TextFieldInputAccessoryAction {
	func textFieldButtonWasPressed()
}
