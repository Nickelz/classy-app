//
//  CourseInformationCell.swift
//  Classy
//
//  Created by Ali Alateiyah on 22/07/2019.
//  Copyright © 2019 Ali Alateiyah. All rights reserved.
//

import UIKit

class CourseInformationCell: UITableViewCell {

	@IBOutlet weak var courseTitleTextField: UITextField!
	@IBOutlet weak var courseInstructorTextField: UITextField!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
