//
//  UIColor+CustomColor.swift
//  myDemo
//
//  Created by Vishwanath Deshmukh on 1/13/18.
//  Copyright © 2018 Vishwanath Deshmukh. All rights reserved.
//

import  UIKit

extension UIColor {
    
    func getDashboardNavigationTintColor() -> UIColor {
        return UIColor(red:0.043, green:0.576 ,blue:0.588 , alpha:1.00)
    }
    
    func attrBackKey() -> AnyObject {
        let attr = [
            NSAttributedStringKey.foregroundColor: UIColor.white,
            NSAttributedStringKey.font: UIFont(name: Constants.dashboardTitleFont, size: CGFloat(Constants.dashboardTitleFontSize))!
        ]
        return attr as AnyObject
    }
    
    
}
