//
//  AccountsViewController.swift
//  Hack110AwesomeApp
//
//  Created by Kyle Ohanian on 11/12/18.
//  Copyright © 2018 Hack110Team. All rights reserved.
//

import UIKit

protocol AccountsViewControllerDelegate {
    func accountSelected(account: Account)
}

class AccountsViewController: UIViewController {

    @IBOutlet weak var accountsLabel: UILabel!
    var selectedAccount: Account?
    
    struct Constants {
        static let accountsListSegue = "accountsListSegue"
        static let accountDetailsSegue = "accountDetailsSegue"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.accountsLabel.textColor = .white
        self.view.backgroundColor = .uncBlue
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Home", style: .done, target: self, action: nil)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.accountsListSegue {
            guard let vc = segue.destination as? AccountsListViewController else {
                return
            }
            vc.accountsViewControllerDelegate = self
        } else if segue.identifier == Constants.accountDetailsSegue {
            guard let vc = segue.destination as? AccountDetailsViewController,
                let account = self.selectedAccount else {
                return
            }
            vc.account = account
        }
    }
}

extension AccountsViewController: AccountsViewControllerDelegate {
    func accountSelected(account: Account) {
        self.selectedAccount = account
        self.performSegue(withIdentifier: Constants.accountDetailsSegue, sender: self)
    }
}
