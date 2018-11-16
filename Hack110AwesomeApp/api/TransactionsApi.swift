//
//  TransactionsApi.swift
//  Hack110AwesomeApp
//
//  Created by Kyle Ohanian on 11/15/18.
//  Copyright © 2018 Hack110Team. All rights reserved.
//

import Foundation

class TransactionsApi {
    static func getTransactions(completion: @escaping ([Transaction]) -> ()) {
        guard let url = URL(string: "\(BaseApi.baseUrl)/transactions") else {
            print("URL is invalid")
            return
        }
        print("\(url.absoluteString)")
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let newData = data else {
                print("Error data is nil")
                return
            }
            let stringData = String(data: newData, encoding: .utf8)
            if (stringData != nil) {
                print(stringData ?? "")
            }
            do {
                let decoder = JSONDecoder()
                let transactions = try decoder.decode([Transaction].self, from: newData)
                completion(transactions)
            } catch let err {
                print("\(err.localizedDescription)")
            }
        }
        task.resume()
    }
}
