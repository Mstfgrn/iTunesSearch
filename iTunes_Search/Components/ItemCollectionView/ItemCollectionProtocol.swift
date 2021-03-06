//
//  ItemCollectionProtocol.swift
//  iTunes_Search
//
//  Created by MstfGrgn on 28.10.2021.
//

import Foundation

protocol ItemCollectionProtocol: AnyObject {
    
    func askNumberOfSection() -> Int
    func askNumberOfItem(in section: Int) -> Int
    func askData(at index: Int) -> Results?
    func selectedItem(at index: Int)
}
extension ItemCollectionProtocol{
    func selectedItem(at index: Int){}
}
