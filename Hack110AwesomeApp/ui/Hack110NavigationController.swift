//
//  Hack110NavigationController.swift
//  Hack110AwesomeApp
//
//  Created by Kyle Ohanian on 11/12/18.
//  Copyright © 2018 Hack110Team. All rights reserved.
//

import UIKit

class Hack110NavigationController: UINavigationController {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationBar.barTintColor = .uncDarkBlue
        self.navigationBar.isTranslucent = false
        self.navigationBar.topItem?.titleView = Hack110NavigationController.hack110Label
    }
}

extension Hack110NavigationController {
    static var hack110Label: UILabel {
        let hackAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 24.0)]
        let hackString = NSAttributedString(string: "HACK", attributes: hackAttributes)
        let numberAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.uncBlue, .font: UIFont.systemFont(ofSize: 24.0)]
        let numberString = NSAttributedString(string: "110", attributes: numberAttributes)
        
        let mutableString = NSMutableAttributedString(string: "")
        mutableString.append(hackString)
        mutableString.append(NSAttributedString(string: " "))
        mutableString.append(numberString)
        let titleLabel = UILabel()
        titleLabel.sizeToFit()
        titleLabel.attributedText = mutableString
        
        return titleLabel
    }
    
    static func basicLabel(string: String) -> UILabel {
        let titleLabel = UILabel()
        titleLabel.sizeToFit()
        titleLabel.text = string
        titleLabel.textColor = .white
        return titleLabel
    }
}
