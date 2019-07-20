//
//  ClassCell.swift
//  Classy
//
//  Created by Ali Alateiyah on 20/07/2019.
//  Copyright © 2019 Ali Alateiyah. All rights reserved.
//

import UIKit

class ClassCell: UITableViewCell {
	
	// Components
	var Container: UIView!
	var StartsStackView: UIStackView!
		var StartsLabel: UILabel!
		var StartsButton: UIButton!
	var EndsStackView: UIStackView!
		var EndsLabel: UILabel!
		var EndsButton: UIButton!
	var VerticalSeparator: UIView!
	var HorizontalSeparator: UIView!
	var ClassRoomTextField: UITextField!
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		let superView = self.contentView
		superView.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1.0)
		
		Container = {
			let view = UIView()
			
			superView.addSubview(view)
			
			// Constaints
			view.snp.makeConstraints({ (make) in
				make.edges.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 20, bottom: 0, right: 20))
			})
			
			// Customization
			view.backgroundColor = .white
			view.layer.cornerRadius = 8
			view.layer.masksToBounds = true
			
			view.dropShadow(shadowRadius: 8.0, shadowOpacity: 1.0, shadowOffset: .zero, shadowColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.08))
			
			return view
		}()
		
		StartsStackView = {
			let stack = UIStackView()
			
			Container.addSubview(stack)
			
			stack.snp.makeConstraints({ (make) in
				make.top.equalToSuperview().offset(7)
				make.left.equalToSuperview().offset(70)
				make.height.equalTo(36)
			})
			
			stack.axis = .vertical
			stack.alignment = .center
			stack.distribution = .fillEqually
			
			return stack
		}()
		
		StartsLabel = {
			let label = UILabel()
			
			StartsStackView.addArrangedSubview(label)
			
			label.text = "STARTS"
			label.font = UIFont(name: "MavenPro-Black", size: 10)
			label.textColor = #colorLiteral(red: 0.7098039216, green: 0.7098039216, blue: 0.7098039216, alpha: 1)
			
			return label
		}()
		
		StartsButton = {
			let button = UIButton()
			
			StartsStackView.addArrangedSubview(button)
			
			button.setTitle("NONE", for: .normal)
			button.setTitleColor(#colorLiteral(red: 0.7098039216, green: 0.7098039216, blue: 0.7098039216, alpha: 1), for: .normal)
			button.titleLabel?.font = UIFont(name: "MavenPro-Medium", size: 15)
			
			return button
		}()
		
		VerticalSeparator = {
			let view = UIView()
			
			Container.addSubview(view)
			
			view.backgroundColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.0)
			view.layer.cornerRadius = 1
			view.layer.masksToBounds = true
			
			return view
		}()
		
		EndsStackView = {
			let stack = UIStackView()
			
			Container.addSubview(stack)
			
			stack.snp.makeConstraints({ (make) in
				make.top.equalToSuperview().offset(7)
				make.right.equalToSuperview().offset(-70)
				make.height.equalTo(36)
			})
			
			VerticalSeparator.snp.makeConstraints({ (make) in
				make.centerY.equalTo(stack)
				make.centerX.equalToSuperview()
				make.width.equalTo(1)
				make.height.equalTo(25)
			})
			
			stack.axis = .vertical
			stack.alignment = .center
			stack.distribution = .fillEqually
			
			return stack
		}()
		
		StartsLabel = {
			let label = UILabel()
			
			EndsStackView.addArrangedSubview(label)
			
			label.text = "ENDS"
			label.font = UIFont(name: "MavenPro-Black", size: 10)
			label.textColor = #colorLiteral(red: 0.7098039216, green: 0.7098039216, blue: 0.7098039216, alpha: 1)
			
			return label
		}()
		
		StartsButton = {
			let button = UIButton()
			
			EndsStackView.addArrangedSubview(button)
			
			button.setTitle("NONE", for: .normal)
			button.setTitleColor(#colorLiteral(red: 0.7098039216, green: 0.7098039216, blue: 0.7098039216, alpha: 1), for: .normal)
			button.titleLabel?.font = UIFont(name: "MavenPro-Medium", size: 15)
			
			return button
		}()
		
		HorizontalSeparator = {
			let view = UIView()
			
			Container.addSubview(view)
			
			view.snp.makeConstraints({ (make) in
				make.top.equalTo(VerticalSeparator.snp.bottom).offset(12)
				make.centerX.equalToSuperview()
				make.width.equalTo(295)
				make.height.equalTo(1)
			})
			
			view.backgroundColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.0)
			view.layer.cornerRadius = 1
			view.layer.masksToBounds = true
			
			return view
		}()
		
		ClassRoomTextField = {
			let textField = UITextField()
		
			Container.addSubview(textField)
			
			textField.snp.makeConstraints({ (make) in
				make.top.equalTo(HorizontalSeparator.snp.bottom)
				make.left.equalToSuperview()
				make.right.equalToSuperview()
				make.bottom.equalToSuperview()
			})
			
			textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: textField.frame.height))
			textField.leftViewMode = .always
			
			textField.backgroundColor = .clear
			textField.font = UIFont(name: "MavenPro-Medium", size: 15)
			textField.placeholder = "Class room"
			
			textField.delegate = self
			
			return textField
		}()
		
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

extension ClassCell: UITextFieldDelegate {
	
}
