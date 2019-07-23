//
//  Constants.swift
//  Classy
//
//  Created by Ali Alateiyah on 23/07/2019.
//  Copyright © 2019 Ali Alateiyah. All rights reserved.
//

import Foundation
import UIKit

public let BACKGROUND_COLOR = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1.0)

public enum TableSections: Int {
	case UpNext = 0, LaterToday
}

enum CellTypes {
	case CourseInformation
	case TimeAndDate
	case AlertsButton
	case ClassesCell
	
	func getHeight() -> CGFloat {
		switch self {
			case .CourseInformation: return 80
			case .ClassesCell, .TimeAndDate: return 90
			case .AlertsButton: return 50
		}
	}
	
	func getClass() -> UITableViewCell.Type {
		switch self {
			case .CourseInformation: return CourseInformationCell.self
			case .TimeAndDate: return DatesCell.self
			case .AlertsButton: return AlertsCell.self
			case .ClassesCell: return ClassCell.self
		}
	}
}

extension UITableViewCell {
	class func reuseIdentifier() -> String {
		return "\(self)"
	}
}
