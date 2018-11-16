//
//  NavControllerPushSegue.swift
//  Hack110AwesomeApp
//
//  Created by Kyle Ohanian on 11/12/18.
//  Copyright © 2018 Hack110Team. All rights reserved.
//

import UIKit

class NavControllerPushSegue: UIStoryboardSegue {
    override func perform() {
        self.source.navigationController?.pushViewController(self.destination, animated: true)
        self.destination.navigationItem.titleView = Hack110NavigationController.hack110Label
    }
}
