//
//  CalendarVC.swift
//  Classy
//
//  Created by Ali Alateiyah on 06/06/2019.
//  Copyright © 2019 Ali Alateiyah. All rights reserved.
//

import UIKit

class CalendarVC: UIViewController {
	
	// Components
	var TitleBar: UIView!
	var DaysCollectionView: UICollectionView!
	var TasksTableView: UITableView!
	

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUserInterface()
    }
    
    func createUserInterface() {
		let superView = self.view!
		
		TitleBar = {
			let view = UIView()
			
			view.backgroundColor = .white
			view.dropShadow(shadowRadius: 8.0, shadowOpacity: 1.0, shadowOffset: CGSize.zero, shadowColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.08))
			view.layer.cornerRadius = 8
			view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
			
			superView.addSubview(view)
			
			view.snp.makeConstraints({ (make) in
				make.top.equalToSuperview()
				make.right.equalToSuperview()
				make.left.equalToSuperview()
				make.height.equalTo(120)
			})
			
			return view
		}()
		
		DaysCollectionView = {
			let layout = UICollectionViewFlowLayout()
			let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
			
			collectionView.dataSource = self
			collectionView.delegate = self

			collectionView.register(DayCell.self, forCellWithReuseIdentifier: "DayCell")
			
			TitleBar.addSubview(collectionView)
			
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
		
		TasksTableView = {
			let tableView = UITableView()
			
			tableView.dataSource = self
			tableView.delegate = self
			
			tableView.register(CalendarCell.self, forCellReuseIdentifier: "Calendar Cell")
			
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

}

extension CalendarVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 20
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DayCell", for: indexPath)
		
		return cell
	}
	
}

extension CalendarVC: UITableViewDelegate, UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 50
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCell(withIdentifier: "Calendar Cell", for: indexPath) as? CalendarCell {
			return cell
		}
		return UITableViewCell()
	}
	
	
}
