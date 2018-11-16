//
//  BankAccountType.swift
//  Hack110AwesomeApp
//
//  Created by Kyle Ohanian on 11/11/18.
//  Copyright © 2018 Hack110Team. All rights reserved.
//

import Foundation

enum AccountType: String, Codable {
    case checking = "Checking"
    case savings = "Savings"
    case retirement = "Retirement"
    case other = "Other"
}
