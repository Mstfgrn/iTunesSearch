//
//  ServiceRequestModel.swift
//  HepsiBurada_CaseStudy
//
//  Created by MstfGrgn on 29.10.2021.
//

import Foundation
struct ServiceRequestModel {
    /*func fetchSearch(with term: String, isEntity entity: String, completion: @escaping ([SearchDataResponse]?)-> Void) {
       
        let endpointUrlRequest = EndpointHelper.searchKey(term: term, entity: entity).urlRequest
        
        let networkOPService = NetworkOperationService(request: endpointUrlRequest)
        networkOPService.downloadJSON { (jsonResponse, httpResponse, error) in
            DispatchQueue.main.async {
                guard let json = jsonResponse,
                    let dictionaries = json["results"] as? [[String : Any]] else {
                        completion(nil)
                        return
                }
                let searchDataResponse = dictionaries.flatMap({ searchDataResponseDictionary in
                    return SearchDataResponse(dictionary: searchDataResponseDictionary)
                })
                
                completion(searchDataResponse)
            }
        }
    }*/
}
