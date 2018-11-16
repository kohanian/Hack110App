//
//  AccountView.swift
//  Hack110AwesomeApp
//
//  Created by Kyle Ohanian on 11/11/18.
//  Copyright © 2018 Hack110Team. All rights reserved.
//

import UIKit

class AccountCell: UICollectionViewCell {
    @IBOutlet weak var accountTypeLabel: UILabel!
    @IBOutlet weak var accountNumberLabel: UILabel!
    @IBOutlet weak var accountAmountLabel: UILabel!
    @IBOutlet weak var accountBalanceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.commonInit()
    }
    
    private func commonInit() {
        self.setComponentLabelColors()
    }
    
    private func setComponentLabelColors() {
        self.backgroundColor = .uncDarkBlue
        self.accountNumberLabel.textColor = .white
        self.accountTypeLabel.textColor = .white
        self.accountAmountLabel.textColor = .white
        self.accountBalanceLabel.textColor = .white
    }
}

extension AccountCell: Configurable {
    typealias T = Account
    
    func configure(model: Account) {
        // configure with view
        self.accountTypeLabel.text = model.type.rawValue
        self.accountNumberLabel.text = model.numberDisplay
        self.accountAmountLabel.text = model.displayAmount
    }
}
