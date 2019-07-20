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
	var CloseButton: UIButton!
	var AddCourseLabel: UILabel!
	var CourseInfoView: UIView!
		var CourseTitleTextField: UITextField!
		var CourseInfoSeparatorLine: UIView!
		var InstructorTextField: UITextField!
	var DatesInfoView: UIView!
		var StartsStackView: UIStackView!
			var StartsLabel: UILabel!
			var StartsButton: UIButton!
		var EndsStackView: UIStackView!
			var EndsLabel: UILabel!
			var EndsButton: UIButton!
		var VerticalSeparator: UIView!
		var HorizontalSeparator: UIView!
		var DaysCollectionView: UICollectionView!
	var AlertsContainer: UIView!
		var AlertsButton: UIButton!
		var AlertsLabel: UILabel!
	var DaysTableView: UITableView!
	
	// Variables
	let days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
	

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
			button.addTarget(self, action:#selector(dismissView), for: .touchUpInside)
			
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
		
		CourseInfoView = {
			let view = UIView()
			
			superView.addSubview(view)
			
			view.snp.makeConstraints({ (make) in
				make.top.equalTo(AddCourseLabel.snp.bottom).offset(26)
				make.left.equalToSuperview().offset(20)
				make.right.equalToSuperview().offset(-20)
				make.height.equalTo(80)
			})
			
			view.backgroundColor = .white
			view.dropShadow(shadowRadius: 8.0, shadowOpacity: 1.0, shadowOffset: CGSize.zero, shadowColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.08))
			view.layer.cornerRadius = 5
			
			return view
		}()
		
		CourseTitleTextField = {
			let textField = UITextField()
			
			CourseInfoView.addSubview(textField)
			
			textField.snp.makeConstraints({ (make) in
				make.top.equalToSuperview()
				make.left.equalToSuperview()
				make.right.equalToSuperview()
				make.height.equalTo(40)
			})
			
			textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: textField.frame.height))
			textField.leftViewMode = .always
			
			
			textField.backgroundColor = .clear
			textField.font = UIFont(name: "MavenPro-Medium", size: 15)
			textField.placeholder = "Course title"
			
			return textField
		}()
		
		CourseInfoSeparatorLine = {
			let view = UIView()
			
			CourseInfoView.addSubview(view)
			
			view.snp.makeConstraints({ (make) in
				make.top.equalTo(CourseTitleTextField.snp.bottom)
				make.left.equalToSuperview().offset(20)
				make.right.equalToSuperview().offset(-20)
				// TEMP
				make.height.equalTo(1)
			})
			
			view.backgroundColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.0)
			view.layer.cornerRadius = 1
			view.layer.masksToBounds = true
			
			return view
		}()
		
		InstructorTextField = {
			let textField = UITextField()
			
			CourseInfoView.addSubview(textField)
			
			textField.snp.makeConstraints({ (make) in
				make.left.equalToSuperview()
				make.right.equalToSuperview()
				make.bottom.equalToSuperview()
				make.height.equalTo(40)
			})
			
			textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: textField.frame.height))
			textField.leftViewMode = .always
			
			
			textField.backgroundColor = .clear
			textField.font = UIFont(name: "MavenPro-Medium", size: 15)
			textField.placeholder = "Instructor"
			
			return textField
		}()
		
		DatesInfoView = {
			let view = UIView()
			
			superView.addSubview(view)
			
			view.snp.makeConstraints({ (make) in
				make.top.equalTo(CourseInfoView.snp.bottom).offset(15)
				make.left.equalToSuperview().offset(20)
				make.right.equalToSuperview().offset(-20)
				make.height.equalTo(90)
			})
			
			view.backgroundColor = .white
			view.dropShadow(shadowRadius: 8.0, shadowOpacity: 1.0, shadowOffset: CGSize.zero, shadowColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.08))
			view.layer.cornerRadius = 5
			
			return view
		}()
		
		StartsStackView = {
			let stack = UIStackView()
			
			DatesInfoView.addSubview(stack)
			
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
			
			DatesInfoView.addSubview(view)
			
			view.backgroundColor = UIColor(red: 0.90, green: 0.90, blue: 0.90, alpha: 1.0)
			view.layer.cornerRadius = 1
			view.layer.masksToBounds = true
			
			return view
		}()
		
		EndsStackView = {
			let stack = UIStackView()

			DatesInfoView.addSubview(stack)

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
			
			DatesInfoView.addSubview(view)
			
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
		
		DaysCollectionView = {
			let layout = UICollectionViewFlowLayout()
			let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
			
			collectionView.dataSource = self
			collectionView.delegate = self
			
			collectionView.register(WeekDayCell.self, forCellWithReuseIdentifier: "DaysCell")
			
			DatesInfoView.addSubview(collectionView)
			
			layout.scrollDirection = .horizontal
			layout.itemSize = CGSize(width: 32, height: 46)
			
			collectionView.collectionViewLayout = layout
			collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20) // Creates a space between the first cell and after the last cell
			collectionView.showsHorizontalScrollIndicator = false
			
			// Constraints
			collectionView.snp.makeConstraints({ (make) in
				make.top.equalToSuperview().offset(50)
				make.right.equalToSuperview()
				make.left.equalToSuperview()
				make.bottom.equalToSuperview()
				
			})
			
			// Customization
			collectionView.backgroundColor = .clear
			
			
			return collectionView
		}()
		
		AlertsContainer = {
			let view = UIView()
			
			superView.addSubview(view)
			
			view.snp.makeConstraints({ (make) in
				make.top.equalTo(DatesInfoView.snp.bottom).offset(15)
				make.left.equalToSuperview().offset(20)
				make.right.equalToSuperview().offset(-20)
				make.height.equalTo(50)
			})
			
			view.backgroundColor = .white
			view.dropShadow(shadowRadius: 8.0, shadowOpacity: 1.0, shadowOffset: CGSize.zero, shadowColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.08))
			view.layer.cornerRadius = 5
			
			return view
		}()
		
		AlertsButton = {
			let button = UIButton()
			
			AlertsContainer.addSubview(button)
			
			button.snp.makeConstraints({ (make) in
				make.top.equalToSuperview()
				make.left.equalToSuperview()
				make.bottom.equalToSuperview()
			})
			
			button.setTitle("Alerts", for: .normal)
			button.setTitleColor(#colorLiteral(red: 0.862745098, green: 0.2588235294, blue: 0.262745098, alpha: 1), for: .normal)
			button.titleLabel?.font = UIFont(name: "MavenPro-Medium", size: 15)
			
			button.contentHorizontalAlignment = .left
			button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
			
			button.addTarget(self, action: #selector(showAlertsView), for: .touchUpInside)
			return button
		}()
		
		AlertsLabel = {
			let label = UILabel()
			
			AlertsContainer.addSubview(label)
			
			label.snp.makeConstraints({ (make) in
				make.top.equalToSuperview().offset(16)
				make.right.equalToSuperview().offset(-10)
				make.bottom.equalToSuperview().offset(-16)
				make.width.equalTo(50)
			})
			
			AlertsButton.snp.makeConstraints({ (make) in
				make.right.equalTo(label.snp.left)
			})
			
			label.text = "NONE"
			label.textColor = #colorLiteral(red: 0.7098039216, green: 0.7098039216, blue: 0.7098039216, alpha: 1)
			label.font = UIFont(name: "MavenPro-Medium", size: 15)
			label.textAlignment = .left
			
			return label
		}()
		
		DaysTableView = {
			let tableView = UITableView()
			
			tableView.dataSource = self
			tableView.delegate = self
			
			tableView.register(ClassCell.self, forCellReuseIdentifier: "Class Cell")
			
			tableView.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1.0)
			tableView.rowHeight = 90.0
			tableView.separatorStyle = .none
			
			superView.addSubview(tableView)
			
			tableView.snp.makeConstraints({ (make) in
				make.top.equalTo(AlertsContainer.snp.bottom).offset(20)
				make.right.equalToSuperview()
				make.left.equalToSuperview()
				make.bottom.equalToSuperview()
			})
			
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

extension AddCourseVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return days.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DaysCell", for: indexPath) as? WeekDayCell {
			cell.DayLabel.text = days[indexPath.row]
			return cell
		}
		return UICollectionViewCell()
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 33.5, height: collectionView.bounds.height)
	}
	
	
}

extension AddCourseVC: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 7
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: "Class Cell", for: indexPath) as? ClassCell {
			return cell
		}
		
		return UITableViewCell()
	}
	
	
}
