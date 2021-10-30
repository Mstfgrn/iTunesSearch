//
//  ItemCollectionProtocol.swift
//  HepsiBurada_CaseStudy
//
//  Created by MstfGrgn on 28.10.2021.
//

import Foundation
protocol ItemCollectionProtocol: AnyObject {
    
    func askNumberOfSection() -> Int
    func askNumberOfItem(in section: Int) -> Int
    //func askData(at index: Int) -> GenericDataProtocol?
}
extension ItemCollectionProtocol{
    func selectedItem(at index: Int){}
}
