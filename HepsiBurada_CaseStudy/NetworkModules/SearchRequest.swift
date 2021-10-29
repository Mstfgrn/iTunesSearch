//
//  SearchRequest.swift
//  HepsiBurada_CaseStudy
//
//  Created by MstfGrgn on 29.10.2021.
//

import Foundation

class SearchRequest: Codable{
    
    private(set) public var limit: Int = 20
    private(set) public var term: String
    private(set) public var entity: String
    
    public init(limit: Int = 20, term: String, entity: String) {
        self.limit = limit
        self.term = term
        self.entity = entity
    }
}
