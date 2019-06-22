//
//  UIViewExt.swift
//  Classy
//
//  Created by Ali Alateiyah on 07/06/2019.
//  Copyright © 2019 Ali Alateiyah. All rights reserved.
//

import UIKit

extension UIView {
    
    func dropShadow(shadowRadius: CGFloat, shadowOpacity: Float, shadowOffset: CGSize, shadowColor: CGColor) {
        self.layer.shadowColor = shadowColor
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = shadowRadius
        self.layer.masksToBounds = false
		self.layer.shouldRasterize = true
		self.layer.rasterizationScale = UIScreen.main.scale
    }
    
}

