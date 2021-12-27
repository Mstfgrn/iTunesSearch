//
//  ServiceProvider.swift
//  iTunes_Search
//
//  Created by MstfGrgn on 29.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage
class ServiceProvider: ApiServiceProvider<SearchRequest> {
    //The provider to this service, on the other hand, goes to its init while I am making the call and initializes the data with the base path.
    init(request: SearchRequest) {
        super.init(method: .get, baseUrl: EndpointHelper.BaseUrls.base.rawValue, path: EndpointHelper.Paths.search.rawValue, data: request)
    }
    
}
