//
//  MainViewModel.swift
//  HW3_Mustafa_Gorgun
//
//  Created by MstfGrgn on 26.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage
class MainViewModel{
    private var data: SearchDataResponse?
    
    func getdata(){
        do{
            guard let urlRequest = try? ServiceProvider(request: getSearchRequest(term: "Apple", entity: "movie")).returnUrlRequest() else {return}
            fireApiCall(with: urlRequest) { [weak self] result in
                switch result{
                case .failure(let error):
                    print("error: \(error)")
                case .success(let response):
                    self?.data = response
                    print(self?.data ?? "data" )
                    print("response: \(response)")
                }
            }
        }
    }
    private func fireApiCall(with request: URLRequest, with completion: @escaping (Result<SearchDataResponse, ErrorResponse>) -> Void) {
        APIManager.shared.executeRequest(urlRequest: request, completion: completion)
    }
    func getSearchRequest(term: String, entity: String) -> SearchRequest{
        return SearchRequest(limit: 1, term: term, entity: entity)
    }

}
