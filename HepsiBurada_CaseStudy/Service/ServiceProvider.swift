//
//  ServiceProvider.swift
//  HepsiBurada_CaseStudy
//
//  Created by MstfGrgn on 29.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage
class ServiceProvider: ApiServiceProvider<SearchRequest> {
    
    init(request: SearchRequest) {
        super.init(method: .get, baseUrl: EndpointHelper.BaseUrls.base.rawValue, path: EndpointHelper.Paths.search.rawValue, data: request)
    }
    
}
