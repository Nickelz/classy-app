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
//	var TasksTableView: UITableView!
	

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
			collectionView.collectionViewLayout = layout
			
			// Constraints
			collectionView.snp.makeConstraints({ (make) in
				make.top.equalToSuperview().offset(45)
				make.right.equalToSuperview()
				make.left.equalToSuperview()
				make.bottom.equalToSuperview().offset(-10)
			})
			
			// Customization
			collectionView.backgroundColor = .yellow
			
			
			return collectionView
		}()
		
    }

}

extension CalendarVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 5
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DayCell", for: indexPath)
		
		return cell
	}
	
}
