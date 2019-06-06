//
//  CalendarVC.swift
//  Classy
//
//  Created by Ali Alateiyah on 06/06/2019.
//  Copyright © 2019 Ali Alateiyah. All rights reserved.
//

import UIKit

class CalendarVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createUserInterface()
    }
    
    func createUserInterface() {
        let label: UILabel = {
            let label = UILabel()
            label.frame = CGRect(x: 10, y: 10, width: 100, height: 75)
            label.text = "Calendar"
            label.textColor = .black
            
            return label
        }()
        
        self.view.addSubview(label)
    }

}
