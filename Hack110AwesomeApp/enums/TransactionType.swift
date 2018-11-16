//
//  BankTransactionType.swift
//  Hack110AwesomeApp
//
//  Created by Kyle Ohanian on 11/13/18.
//  Copyright © 2018 Hack110Team. All rights reserved.
//

import Foundation

enum TransactionType: String, Codable {
    case post = "Post"
    case withdrawal = "Withdrawal"
}
