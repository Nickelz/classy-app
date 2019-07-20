//
//  DaysCell.swift
//  Classy
//
//  Created by Ali Alateiyah on 19/07/2019.
//  Copyright © 2019 Ali Alateiyah. All rights reserved.
//

import UIKit

class WeekDayCell: UICollectionViewCell {
	
	// Components
	var DayLabel: UILabel!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		let superView = super.contentView
		
		DayLabel = {
			let label = UILabel()
			
			superView.addSubview(label)
			
			label.snp.makeConstraints({ (make) in
				make.top.equalToSuperview()
				make.right.equalToSuperview()
				make.left.equalToSuperview()
				make.bottom.equalToSuperview()
			})
			
			label.font = UIFont(name: "MavenPro-Medium", size: 15)
			label.textColor = #colorLiteral(red: 0.7098039216, green: 0.7098039216, blue: 0.7098039216, alpha: 1)
			label.text = "Fri"
			label.textAlignment = .center
			
			return label
		}()
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
