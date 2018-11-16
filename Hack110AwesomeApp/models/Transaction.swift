//
//  Transaction.swift
//  Hack110AwesomeApp
//
//  Created by Kyle Ohanian on 11/13/18.
//  Copyright © 2018 Hack110Team. All rights reserved.
//

import UIKit

struct Transaction {
    var id: String
    var amount: Double
    var type: TransactionType
    var accountId: String?
    var originAccountId: String?
    var transferAccountId: String?
    var date: Date?
    var itemPurchased: String?
    
    var description: String {
        switch type {
        case .post:
            return ""
        case .purchase:
            return itemPurchased ?? ""
        case .transfer:
            guard let origin = originAccountId, let transfer = transferAccountId else {
                return ""
            }
            return "\(origin) -> \(transfer)"
        case .withdrawal:
            return ""
        }
    }
    
    var color: UIColor {
        switch type {
        case .post:
            return .green
        case .purchase:
            return .purple
        case .transfer:
            return .blue
        case .withdrawal:
            return .red
        }
    }
    
//    init(id: String, amount: Double, type: TransactionType, accountId: String) {
//        self.id = id
//        self.amount = amount
//        self.type = type
//        self.accountId = accountId
//    }
    
    enum TransactionCodingKeys: String, CodingKey {
        case id = "id"
        case amount = "amount"
        case type = "type"
        case accountId = "account_id"
        case originAccountId = "origin_account_id"
        case transferAccountId = "transfer_account_id"
        case date = "date"
        case itemPurchased = "item_purchased"
    }
}

extension Transaction: Moneyable {
    var moneyAmount: Double {
        return self.amount
    }
}

extension Transaction: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: TransactionCodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.amount = try container.decode(Double.self, forKey: .amount)
        self.type = try container.decode(TransactionType.self, forKey: .type)
        self.accountId = try? container.decode(String.self, forKey: .accountId)
        self.originAccountId = try? container.decode(String.self, forKey: .originAccountId)
        self.transferAccountId = try? container.decode(String.self, forKey: .transferAccountId)
        let stringDate = try container.decode(String.self, forKey: .date)
        self.date = Date.formatDate(from: stringDate)
        self.itemPurchased = try? container.decode(String.self, forKey: .itemPurchased)
    }
}
