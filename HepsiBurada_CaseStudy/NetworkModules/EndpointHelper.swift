//
//  EndpointHelper.swift
//  WeatherApplication
//
//  Created by MstfGrgn on 27.10.2021.
//

import Foundation

enum EndpointHelper {
    // The structure contained in this allows me to obtain the Url needed to search for APIs.
    enum BaseUrls:String{
        case base = "https://itunes.apple.com/"
    }
    enum Paths:String{
        case search = "/search"
    }
     var baseUrl: String{
        return "https://itunes.apple.com/"
    }
     var path: String{
        switch self {
        case .searchKey:
            return "/search"
        }
    }
    
    case searchKey(term: String, entity: String)
    
    var urlRequest: URLRequest{
        var component = URLComponents(string: baseUrl)!
        component.path = path
        component.queryItems = queryComponents
        let urlcomp = component.url!
        return URLRequest(url: urlcomp)
    }
    
    private struct variableKey{
        static let term = "term"
        static let entity = "entity"
    }
    
    private struct defaultValue{
        static let term = "apple"
    }
    //term = jack johnson, Michael Jackson, instagram, uber, entity = song, software, movie, audiobook
    private var queryParameter: [String: Any]{
        switch self {
        case .searchKey(term: let term, entity: let entity):
            let queryParameter: [String: Any] = [
                variableKey.term: term,
                variableKey.entity: entity
            ]
            return queryParameter
        }
    }
    private var queryComponents: [URLQueryItem]{
        var comp = [URLQueryItem]()
        for (key, value) in queryParameter{
            let queryItem = URLQueryItem(name: key, value: "\(value)")
            comp.append(queryItem)
        }
        return comp
    }
    
}
