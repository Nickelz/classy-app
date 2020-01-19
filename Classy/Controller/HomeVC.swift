//
//  HomeVC.swift
//  Classy
//
//  Created by Ali Alateiyah on 05/06/2019.
//  Copyright © 2019 Ali Alateiyah. All rights reserved.
//

import UIKit
import SnapKit
import Firebase

class HomeVC: UIViewController {
    
    // Components
    var TitleBar: UIView!
	var TitleLabel: UILabel!
    var HomeTableView: UITableView!
	var ProfileCircle: UIView!
    var ProfileName: UILabel!
	
	// Temp
	let arr = [
		["Study Mathematics", "Go to grandma's", "Play basketball", "Finish my paperwork"],
		["Study again", "Clean my bed", "Wash my clothes"]
	]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUserInterface()
    }
    
    func createUserInterface() {
        let superView = self.view!
		
		HomeTableView = {
			let tableView = UITableView(frame: .zero, style: .grouped)
			
			tableView.dataSource = self
			tableView.delegate = self
			
			tableView.register(HomeCell.self, forCellReuseIdentifier: "Cell")
			
			tableView.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.97, alpha: 1.0)
			tableView.rowHeight = 80.0
			tableView.separatorStyle = .none
			
			superView.addSubview(tableView)
			
			tableView.snp.makeConstraints({ (make) in
				make.right.equalToSuperview()
				make.left.equalToSuperview()
				make.bottom.equalToSuperview()
			})
			
			return tableView
		}()
		
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
                make.height.equalTo(91)
            })
			
			HomeTableView.snp.makeConstraints({ (make) in
				make.top.equalTo(view.snp.bottom)
			})
			
            return view
        }()
		
		
		TitleLabel = {
			let label = UILabel()
			
			TitleBar.addSubview(label)
			
			// Constraints
			label.snp.makeConstraints({ (make) in
				make.centerX.equalToSuperview()
				make.bottom.equalToSuperview().offset(-15)
			})
			
			// Customization
			label.text = "Home"
			label.font = UIFont(name: "MavenPro-Bold", size: 19)
			label.textColor = .black
			
			return label
		}()
        
        ProfileCircle = {
            let view = UIView()
            TitleBar.addSubview(view)
            
            view.snp.makeConstraints { (make) in
                make.right.equalToSuperview().offset(-20)
                make.centerY.equalTo(TitleLabel)
                make.width.equalTo(30)
                make.height.equalTo(30)
            }
            
            view.layoutIfNeeded()
            view.backgroundColor = #colorLiteral(red: 0.8, green: 0.8, blue: 0.8, alpha: 1)
            view.layer.cornerRadius = view.frame.width / 2
            view.layer.masksToBounds = true
            
            return view
        }()
        
        ProfileName = {
            let label = UILabel()
            
            ProfileCircle.addSubview(label)
            
            label.snp.makeConstraints { (make) in
                make.top.equalToSuperview()
                make.right.equalToSuperview()
                make.bottom.equalToSuperview()
                make.left.equalToSuperview()
            }
            
            label.textAlignment = .center
            label.text = "-"
            label.font = UIFont(name: "MavenPro-Medium", size: 12)
            label.textColor = .black
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(ProfileNameLabelPressed))
            label.isUserInteractionEnabled = true
            label.addGestureRecognizer(tap)
            
            return label
        }()

    }
    
    @objc func ProfileNameLabelPressed() {
        let alert = UIAlertController(title: "Profile", message: Auth.auth().currentUser?.email, preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        let logout = UIAlertAction(title: "Log out", style: .destructive) { _ in
            do {
                try Auth.auth().signOut()
            } catch let signOutError as NSError {
                print("Error signing out: %@", signOutError)
            }
        }
        
        alert.addAction(logout)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
	
    func numberOfSections(in tableView: UITableView) -> Int {
        return arr.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? HomeCell {
			cell.taskTitle!.text = arr[indexPath.section][indexPath.row]
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
		view.frame = CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 35)
        view.backgroundColor = .clear

        let label = UILabel()
		label.frame = CGRect(x: 20, y: 5, width: tableView.bounds.width - 30, height: 35)
		label.font = UIFont(name: "MavenPro-Bold", size: 15)

        if let tableSection = TableSections(rawValue: section) {
            switch tableSection {
				case .LaterToday: label.text = "LATER TODAY"
				case .UpNext: label.text = "UP NEXT"
            }
        }
		
        view.addSubview(label)
        return view
    }


}
