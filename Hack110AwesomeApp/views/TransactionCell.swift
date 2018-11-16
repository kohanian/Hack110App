//
//  TransactionCell.swift
//  Hack110AwesomeApp
//
//  Created by Kyle Ohanian on 11/16/18.
//  Copyright © 2018 Hack110Team. All rights reserved.
//

import UIKit

class TransactionCell: UICollectionViewCell {
    
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension TransactionCell: Configurable {
    typealias T = Transaction
    
    func configure(model: Transaction) {
        self.typeLabel.textColor = model.color
        self.amountLabel.textColor = model.color
        self.descriptionLabel.textColor = model.color
        self.dateLabel.textColor = model.color
        
        self.typeLabel.text = model.type.rawValue
        self.amountLabel.text = model.displayAmount
        self.descriptionLabel.text = model.description
        guard let date = model.date else {
            self.dateLabel.text = "N/A"
            return
        }
        self.dateLabel.text = date.toString(to: Date.wordedMonth)
    }
}
