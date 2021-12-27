//
//  GenericValueProtocol.swift
//  iTunes_Search
//
//  Created by MstfGrgn on 10.10.2021.
//

import Foundation

protocol GenericValueProtocol {
    associatedtype Value
    var value: Value { get }
}
