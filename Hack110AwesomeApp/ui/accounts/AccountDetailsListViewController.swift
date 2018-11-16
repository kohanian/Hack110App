//
//  AccountDetailsListViewController.swift
//  Hack110AwesomeApp
//
//  Created by Kyle Ohanian on 11/13/18.
//  Copyright © 2018 Hack110Team. All rights reserved.
//

import UIKit

private enum CollectionViewSection: Int {
    case account = 0
    case transactions
    case count
}

protocol AccountDetailsListViewControllerDelegate {
    func collectionView(_ collectionView: UICollectionView, accountsCellAtIndexPath indexPath: IndexPath) -> UICollectionViewCell
    func collectionView(_ collectionView: UICollectionView, transactionsCellAtIndexPath indexPath: IndexPath) -> UICollectionViewCell
}

class AccountDetailsListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    struct Constants {
        static let nibName = "AccountCell"
        static let reuseIdentifier = "accountCell"
        static let collectionViewLineSpacingForSections: CGFloat = 10
        static let collectionViewItemHeight: CGFloat = 160
    }
    
    var transactions: [Transaction] = []
    var account: Account!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UINib(nibName: Constants.nibName, bundle: nil), forCellWithReuseIdentifier: Constants.reuseIdentifier)
        // Do any additional setup after loading the view.
    }
}

extension AccountDetailsListViewController: UICollectionViewDelegateFlowLayout {
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
    }
    
}

extension AccountDetailsListViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return CollectionViewSection.count.rawValue
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch CollectionViewSection(rawValue: section) {
        case .account?:
            return 1
        case .transactions?:
            return transactions.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let delegate: AccountDetailsListViewControllerDelegate = self
        switch CollectionViewSection(rawValue: indexPath.section) {
        case .account?:
            return delegate.collectionView(collectionView, accountsCellAtIndexPath: indexPath)
        case .transactions?:
            return delegate.collectionView(collectionView, transactionsCellAtIndexPath: indexPath)
        default:
            return UICollectionViewCell(frame: .zero)
        }
    }
}

extension AccountDetailsListViewController: AccountDetailsListViewControllerDelegate {
    func collectionView(_ collectionView: UICollectionView, accountsCellAtIndexPath indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.reuseIdentifier, for: indexPath) as? AccountCell else {
            return UICollectionViewCell(frame: .zero)
        }
        cell.configure(model: account)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, transactionsCellAtIndexPath indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.reuseIdentifier, for: indexPath) as? AccountCell else {
            return UICollectionViewCell(frame: .zero)
        }
        cell.configure(model: account)
        return cell
    }
    
}
