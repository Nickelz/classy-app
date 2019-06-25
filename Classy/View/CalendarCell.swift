//
//  CalendarCell.swift
//  Classy
//
//  Created by Ali Alateiyah on 25/06/2019.
//  Copyright © 2019 Ali Alateiyah. All rights reserved.
//

import UIKit

class CalendarCell: UITableViewCell {

	// Components
	var containerView: UIView!
	var line: UIView!
	var taskTitle: UILabel!

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		let superView = self.contentView
		superView.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1.0)
		
		containerView = {
			containerView = UIView()
			
			superView.addSubview(containerView)
			
			// Constaints
			containerView.snp.makeConstraints({ (make) in
				make.edges.equalToSuperview().inset(UIEdgeInsets(top: 10, left: 20, bottom: 0, right: 20))
			})
			
			// Customization
			containerView.backgroundColor = .white
			containerView.layer.cornerRadius = 8
			containerView.layer.masksToBounds = true
			
			containerView.dropShadow(shadowRadius: 8.0, shadowOpacity: 1.0, shadowOffset: .zero, shadowColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.08))
			
			return containerView
		}()
		
		line = {
			let view = UIView()
			
			containerView.addSubview(view)
			
			// Constraints
			view.snp.makeConstraints({ (make) in
				make.top.equalToSuperview().offset(10)
				make.left.equalToSuperview().offset(10)
				make.bottom.equalToSuperview().offset(-10)
				make.width.equalTo(2)
			})
			
			// Customization
			view.backgroundColor = .black
			view.layer.cornerRadius = 1
			view.layer.masksToBounds = true
			
			return view
		}()
		
		taskTitle = {
			let label = UILabel()
			
			containerView.addSubview(label)
			
			// Constraints
			label.snp.makeConstraints({ (make) in
				make.top.equalToSuperview()
				make.bottom.equalToSuperview()
				make.right.equalToSuperview()
				make.left.equalTo(line).offset(20)
			})
			
			// Customization
			label.text = "Study Mathematics"
			label.font = UIFont(name: "MavenPro-Medium", size: 17)
			
			return label
		}()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
}
