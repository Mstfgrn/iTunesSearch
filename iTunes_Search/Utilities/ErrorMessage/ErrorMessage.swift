//
//  ErrorMessage.swift
//  HepsiBurada_CaseStudy
//
//  Created by MstfGrgn on 29.10.2021.
//

import Foundation

enum ErrorMessage: String, Error{
    case invalidData = "Something went wrong, try again"
    case invalidResponse = "Server error, Plase check your condition"
    case invalidSearch = "Search not found"
}
