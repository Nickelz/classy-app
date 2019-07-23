//
//  AddCourseVC.swift
//  Classy
//
//  Created by Ali Alateiyah on 01/07/2019.
//  Copyright © 2019 Ali Alateiyah. All rights reserved.
//

import UIKit
import SnapKit

class AddCourseVC: UIViewController {
	
	// Compoenets
	var TableView: UITableView!
	var CloseButton: UIButton!
	var AddCourseLabel: UILabel!
	
	// Variables
	var cellTypes: [CellTypes] = [.CourseInformation, .TimeAndDate, .AlertsButton, .ClassesCell]
	var addedClasses = 10

    override func viewDidLoad() {
        super.viewDidLoad()
		
		createUserInterface()
    }
	
	func createUserInterface() {
		let superView = self.view!
		superView.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1.0)
		
		CloseButton = {
			let button = UIButton()
			
			superView.addSubview(button)
			
			button.snp.makeConstraints({ (make) in
				make.top.equalToSuperview().offset(56)
				make.left.equalToSuperview().offset(20)
			})
			
			let icon = UIImage(named: "close")
			button.setImage(icon, for: .normal)
			button.imageView?.contentMode = .scaleAspectFit
			button.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
			
			return button
		}()
		
		AddCourseLabel = {
			let label = UILabel()
			
			superView.addSubview(label)
			
			label.snp.makeConstraints({ (make) in
				make.top.equalTo(CloseButton)
				make.centerX.equalToSuperview()
			})
			
			label.text = "Add Course"
			label.font = UIFont(name: "MavenPro-Bold", size: 19)
			label.textColor = .black
			
			return label
		}()
		
		TableView = {
			let tableView = UITableView()
			
			superView.addSubview(tableView)
			
			tableView.backgroundColor = BACKGROUND_COLOR
			
			tableView.snp.makeConstraints({ (make) in
				make.top.equalTo(AddCourseLabel.snp.bottom).offset(20)
				make.left.equalToSuperview()
				make.right.equalToSuperview()
				make.bottom.equalToSuperview()
			})
			
			tableView.delegate = self
			tableView.dataSource = self
			
			for type in cellTypes {
				let nib = UINib(nibName: type.getClass().reuseIdentifier(), bundle: nil)
				tableView.register(nib, forCellReuseIdentifier: type.getClass().reuseIdentifier())
			}
			
			return tableView
		}()

		
	}
	
	// Close button handler
	@objc func dismissView() {
		self.dismiss(animated: false, completion: nil)
	}
	
	// Alerts button handler
	@objc func showAlertsView(sender: AnyObject) {
		print("Alerts button pressed")
	}

}

extension AddCourseVC: UITableViewDelegate, UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 4
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if section != 3 {
			return 1
		}
		
		return cellTypes.count + addedClasses
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		let cell = cellTypes[indexPath.section]
		return cell.getHeight()
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cellType = cellTypes[indexPath.section]
		let cellClass = cellType.getClass()
		
		if indexPath.section != 3 {
			let cell = tableView.dequeueReusableCell(withIdentifier: cellClass.reuseIdentifier(), for: indexPath)
			return cell
		}
		
		return tableView.dequeueReusableCell(withIdentifier: "ClassCell", for: indexPath)
	}
	
}
