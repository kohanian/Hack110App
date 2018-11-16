//
//  Moneyable.swift
//  Hack110AwesomeApp
//
//  Created by Kyle Ohanian on 11/13/18.
//  Copyright © 2018 Hack110Team. All rights reserved.
//

import Foundation

protocol Moneyable {
    var moneyAmount: Double { get }
}

extension Moneyable {
    var displayAmount: String {
        return String(format: "$%.2f", moneyAmount)
    }
}
