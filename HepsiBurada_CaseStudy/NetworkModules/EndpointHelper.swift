//
//  EndpointHelper.swift
//  WeatherApplication
//
//  Created by MstfGrgn
//

import Foundation

typealias BaseUrl = EndpointHelper.BaseUrls
typealias Paths = EndpointHelper.Paths

enum EndpointHelper {

    enum BaseUrls: String {
        case dev = "https://picsum.photos/v2/"
    }

    enum Paths: String {
        case list = "list"
    }
    
}
