//
//  AccountsApi.swift
//  Hack110AwesomeApp
//
//  Created by Kyle Ohanian on 11/14/18.
//  Copyright © 2018 Hack110Team. All rights reserved.
//

import Foundation

class AccountsApi {
    static func getAccounts(completion: @escaping ([Account]) -> ()) {
        guard let url = URL(string: "\(BaseApi.baseUrl)/accounts") else {
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
                let accounts = try decoder.decode([Account].self, from: newData)
                completion(accounts)
            } catch {
                print("Error in do catch")
            }
        }
        task.resume()
    }
    
}
