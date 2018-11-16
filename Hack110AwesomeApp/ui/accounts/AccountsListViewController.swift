//
//  ViewController.swift
//  Hack110AwesomeApp
//
//  Created by Kyle Ohanian on 11/11/18.
//  Copyright © 2018 Hack110Team. All rights reserved.
//

import UIKit

class AccountsListViewController: UIViewController {
    
    @IBOutlet weak var accountsCollectionView: UICollectionView!
    
    struct Constants {
        static let primaryColor = UIColor.uncBlue
        static let nibName = "AccountCell"
        static let reuseIdentifier = "accountCell"
        static let collectionViewLineSpacingForSections: CGFloat = 10
        static let collectionViewItemHeight: CGFloat = 160
    }
    
    var accounts: [Account] = []
    var accountsViewControllerDelegate: AccountsViewControllerDelegate?
    
    var selectedIndexPath: IndexPath = IndexPath(row: 0, section: 0)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.injectTestData()
        self.commonInit()
    }
    
    private func injectTestData() {
        accounts.append(Account(type: .checking, number: "1111111111", amount: 64.35))
        accounts.append(Account(type: .savings, number: "1212121212", amount: 30.01))
        accounts.append(Account(type: .retirement, number: "3333333333", amount: 0.00))
    }
    
    private func commonInit() {
        self.view.backgroundColor = Constants.primaryColor
        self.accountsCollectionView.backgroundColor = Constants.primaryColor
        self.accountsCollectionView.delegate = self
        self.accountsCollectionView.dataSource = self
        self.accountsCollectionView.register(UINib(nibName: Constants.nibName, bundle: nil), forCellWithReuseIdentifier: Constants.reuseIdentifier)
        self.accountsCollectionView.reloadData()
    }
}


extension AccountsListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Constants.collectionViewLineSpacingForSections
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width,
                      height: Constants.collectionViewItemHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10.0, left: 0.0, bottom: 0.0, right: 0.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        accountsViewControllerDelegate?.accountSelected(account: accounts[indexPath.section])
    }
    
}

extension AccountsListViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return accounts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.reuseIdentifier, for: indexPath) as? AccountCell else {
            return UICollectionViewCell(frame: .zero)
        }
        cell.configure(model: accounts[indexPath.section])
        return cell
    }
}

