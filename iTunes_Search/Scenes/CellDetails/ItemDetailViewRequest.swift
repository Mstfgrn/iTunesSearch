//
//  ItemDetailViewRequest.swift
//  iTunes_Search
//
//  Created by MstfGrgn on 31.10.2021.
//

import Foundation
typealias ItemDetailRequestBlock = (ItemDetailViewRequest) -> Void
class ItemDetailViewRequest {
    
    //The type of data I defined in the init in SearchViewModel is this class. To pass this data to the Item Detail component, I initialize it inside the data.
    
    private(set) var imageUrl: String //res.artworkUrl100
    private(set) var name: String //res.collectionName ?? res.trackName
    private(set) var price: Double //"$\(res.collectionPrice ?? 0)"
    private(set) var detail: String //res.resultDescription ?? res.longDescription ?? res.shortDescription
    
    init(imageUrl: String, name: String, price: Double, detail: String) {
        self.imageUrl = imageUrl
        self.name = name
        self.price = price
        self.detail = detail
    }

}
