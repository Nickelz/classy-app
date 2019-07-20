//
//  CoursesVC.swift
//  Classy
//
//  Created by Ali Alateiyah on 06/06/2019.
//  Copyright © 2019 Ali Alateiyah. All rights reserved.
//

import UIKit

class CoursesVC: UIViewController {
	
	// Components
	var TitleBar: UIView!
	var TitleLabel: UILabel!
	var EditButton: UIButton!
	var AddButton: UIButton!
	var CoursesTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUserInterface()
    }
    
    func createUserInterface() {
		let superView = self.view!
		
		TitleBar = {
			let view = UIView()
			
			superView.addSubview(view)
			
			view.snp.makeConstraints({ (make) in
				make.top.equalToSuperview()
				make.right.equalToSuperview()
				make.left.equalToSuperview()
				make.height.equalTo(91)
			})
			
			view.backgroundColor = .white
			view.dropShadow(shadowRadius: 8.0, shadowOpacity: 1.0, shadowOffset: CGSize.zero, shadowColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.08))
			view.layer.cornerRadius = 8
			view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
			
			return view
		}()
		
		TitleLabel = {
			let label = UILabel()
			
			TitleBar.addSubview(label)
			
			label.snp.makeConstraints({ (make) in
				make.centerX.equalToSuperview()
				make.bottom.equalToSuperview().offset(-15)
			})
			
			label.text = "Courses"
			label.font = UIFont(name: "MavenPro-Bold", size: 19)
			label.textColor = .black
			
			return label
		}()
		
		EditButton = {
			let button = UIButton()
			
			TitleBar.addSubview(button)
			
			// Constraints
			button.snp.makeConstraints({ (make) in
				make.centerY.equalTo(TitleLabel)
				make.left.equalToSuperview().offset(20)
			})
			
			// Customization
			let icon = UIImage(named: "edit")
			button.setImage(icon, for: .normal)
			button.imageView?.contentMode = .scaleAspectFit
			
			return button
		}()
		
		AddButton = {
			let button = UIButton()
			
			TitleBar.addSubview(button)
			
			button.snp.makeConstraints({ (make) in
				make.centerY.equalTo(TitleLabel)
				make.right.equalToSuperview().offset(-20)
			})
			
			let icon = UIImage(named: "add")
			button.setImage(icon, for: .normal)
			button.imageView?.contentMode = .scaleAspectFit
			button.addTarget(self, action: #selector(addButtonHandler), for: .touchUpInside)
			
			return button
		}()
		
		CoursesTableView = {
			let tableView = UITableView()
			
			tableView.dataSource = self
			tableView.delegate = self
			
			tableView.register(CourseCell.self, forCellReuseIdentifier: "Courses Cell")
			
			tableView.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1.0)
			tableView.rowHeight = 80.0
			tableView.separatorStyle = .none
			
			superView.addSubview(tableView)
			
			tableView.snp.makeConstraints({ (make) in
				make.top.equalTo(TitleBar.snp.bottom)
				make.right.equalToSuperview()
				make.left.equalToSuperview()
				make.bottom.equalToSuperview()
			})
			
			return tableView
		}()
    }
	
	@objc func addButtonHandler() {
		let vc = AddCourseVC()
		self.present(vc, animated: false, completion: nil)
	}

}

extension CoursesVC: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 50
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: "Courses Cell", for: indexPath) as? CourseCell {
			return cell
		}
		return UITableViewCell()
	}
	
	
}
