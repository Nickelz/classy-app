//
//  DatesCell.swift
//  Classy
//
//  Created by Ali Alateiyah on 22/07/2019.
//  Copyright © 2019 Ali Alateiyah. All rights reserved.
//

import UIKit

class DatesCell: UITableViewCell {
	
	// Components
	@IBOutlet weak var containerView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		containerView.backgroundColor = .white
		containerView.layer.cornerRadius = 5
		containerView.layer.masksToBounds = true
		
		containerView.dropShadow(shadowRadius: 4.0, shadowOpacity: 1.0, shadowOffset: .zero, shadowColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.08))
		
		self.contentView.backgroundColor = BACKGROUND_COLOR
	}
    
}
