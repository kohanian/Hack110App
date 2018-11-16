//
//  BankAccountType.swift
//  Hack110AwesomeApp
//
//  Created by Kyle Ohanian on 11/11/18.
//  Copyright © 2018 Hack110Team. All rights reserved.
//

import Foundation

enum AccountType: String, Codable {
    case checking = "CHECKING"
    case savings = "SAVINGS"
    case retirement = "RETIREMENT"
    case other = "OTHER"
}
