//
//  UIColor+Extensions.swift
//  Hack110AwesomeApp
//
//  Created by Kyle Ohanian on 11/11/18.
//  Copyright © 2018 Hack110Team. All rights reserved.
//

import UIKit

extension UIColor {
    
    static let uncBlue = UIColor(red: 75, green: 156, blue: 211, alpha: 1.0)
    
    static let uncDarkBlue = UIColor(red: 19, green: 41, blue: 75, alpha: 1.0)
    
    convenience init(red: Int,
                     green: Int,
                     blue: Int,
                     alpha: CGFloat) {
        let divideByConstant: CGFloat = 256.0
        self.init(red: CGFloat(red) / divideByConstant,
                  green: CGFloat(green) / divideByConstant,
                  blue: CGFloat(blue) / divideByConstant,
                  alpha: alpha)
    }
}
