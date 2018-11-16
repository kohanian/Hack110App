//
//  Account.swift
//  Hack110AwesomeApp
//
//  Created by Kyle Ohanian on 11/11/18.
//  Copyright © 2018 Hack110Team. All rights reserved.
//

import Foundation

struct Account {
    var type: AccountType
    var number: String
    var amount: Double
    
    var numberDisplay: String {
        return "....\(String(number.suffix(4)))"
    }
    
    init(type: AccountType, number: String, amount: Double) {
        self.type = type
        self.number = number
        self.amount = amount
    }
    
    enum AccountCodingKeys: String, CodingKey {
        case type = "type"
        case amount = "balance"
        case number = "id"
    }
}

extension Account: Moneyable {
    var moneyAmount: Double {
        return amount
    }
}

extension Account: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AccountCodingKeys.self)
        self.type = try container.decode(AccountType.self, forKey: .type)
        self.number = try container.decode(String.self, forKey: .number)
        self.amount = try container.decode(Double.self, forKey: .amount)
    }
}
