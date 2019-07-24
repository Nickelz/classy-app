//
//  DoneCell.swift
//  Classy
//
//  Created by Ali Alateiyah on 24/07/2019.
//  Copyright © 2019 Ali Alateiyah. All rights reserved.
//

import UIKit

class DoneCell: UITableViewCell {
	
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
		
		containerView.layer.cornerRadius = 5
		containerView.layer.masksToBounds = true
		
		self.contentView.backgroundColor = BACKGROUND_COLOR
	}
    
}
