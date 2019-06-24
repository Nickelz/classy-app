//
//  DayCell.swift
//  Classy
//
//  Created by Ali Alateiyah on 23/06/2019.
//  Copyright © 2019 Ali Alateiyah. All rights reserved.
//

import UIKit

class DayCell: UICollectionViewCell {
	
	// Components
	var containerView: UIView!
	var dateStack: UIStackView!
	var weekdayLabel: UILabel!
	var dateLabel: UILabel!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		let superView = self.contentView
		
		containerView = {
			let view = UIView()
			
			superView.addSubview(view)
			
			// Constraints
			view.snp.makeConstraints({ (make) in
				make.edges.equalToSuperview()
			})
			
			// Customization
			view.backgroundColor = .black
			view.layer.cornerRadius = 8
			view.layer.masksToBounds = true
			
			return view
		}()
		
		dateStack = {
			let stack = UIStackView()
			
			containerView.addSubview(stack)
			
			// Constraints
			stack.snp.makeConstraints({ (make) in
				make.edges.equalToSuperview()
			})
			
			// Customization
			stack.axis = .vertical
			stack.alignment = .center
			stack.distribution = .fillEqually
			
			return stack
		}()
		
		weekdayLabel = {
			let label = UILabel()
			
			dateStack.addArrangedSubview(label)
			
			label.font = UIFont(name: "MavenPro-Medium", size: 14)
			label.textColor = .white
			label.text = "Fri"
			
			return label
		}()
		
		dateLabel = {
				let label = UILabel()
				
				dateStack.addArrangedSubview(label)
			
				label.font = UIFont(name: "MavenPro-Medium", size: 14)
				label.textColor = .white
				label.text = "25"
				
				return label
			}()
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
}
