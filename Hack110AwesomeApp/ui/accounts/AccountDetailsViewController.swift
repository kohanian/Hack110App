//
//  AccountDetailsViewController.swift
//  Hack110AwesomeApp
//
//  Created by Kyle Ohanian on 11/12/18.
//  Copyright © 2018 Hack110Team. All rights reserved.
//

import UIKit

class AccountDetailsViewController: UIViewController {

    var account: Account!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .uncDarkBlue
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "accountDetailsList" {
            guard let vc = segue.destination as? AccountDetailsListViewController else {
                return
            }
            vc.account = self.account
        }
    }

}
