//
//  SearchRequest.swift
//  iTunes_Search
//
//  Created by MstfGrgn on 29.10.2021.
//

import Foundation

class SearchRequest: Codable{
    // The getSearchRequest function I use in MainViewModel returns SearchRequest type. This is how I set the limit.
    private(set) public var limit: Int = 20
    private(set) public var term: String
    private(set) public var entity: String
    
    public init(limit: Int = 20, term: String, entity: String) {
        self.limit = limit
        self.term = term
        self.entity = entity
    }
}
