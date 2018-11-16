//
//  Configurable.swift
//  Hack110AwesomeApp
//
//  Created by Kyle Ohanian on 11/11/18.
//  Copyright © 2018 Hack110Team. All rights reserved.
//

import Foundation

protocol Configurable {
    associatedtype T
    func configure(model: T)
}
