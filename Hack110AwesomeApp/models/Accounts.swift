//
//  Accounts.swift
//  Hack110AwesomeApp
//
//  Created by Kyle Ohanian on 11/14/18.
//  Copyright © 2018 Hack110Team. All rights reserved.
//

import Foundation

struct Accounts {
    var accounts: [Account]
    
    enum AccountsCodingKeys: String, CodingKey {
        case accounts = "accounts"
    }
}

extension Accounts: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AccountsCodingKeys.self)
        self.accounts = try container.decode([Account].self, forKey: .accounts)
    }
}
