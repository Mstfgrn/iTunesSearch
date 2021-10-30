//
//  MainViewModel.swift
//  HW3_Mustafa_Gorgun
//
//  Created by MstfGrgn on 26.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage
class MainViewModel{
    var data: SearchDataResponse?
    private var state: CollectionViewStateBlock?
    private var resResult = [Results?]()
    func subscribeState(completion: @escaping CollectionViewStateBlock) {
        state = completion
    }
    func getdata(){
        do{
            guard let urlRequest = try? ServiceProvider(request: getSearchRequest(term: "Apple", entity: "movie")).returnUrlRequest() else {return}
            state?(.loading)
            fireApiCall(with: urlRequest) { [weak self] result in
                switch result{
                case .failure(let error):
                    print("error: \(error)")
                case .success(let response):
                    self?.data = response
                    self?.resResult = response.results!
                    print("responseEEEEE: \(self?.resResult)")
                    
                    //print(self?.data ?? "data" )
                    //print("response: \(response)")
                }
                self?.state?(.done)
            }
        }
    }
    private func dataHandler(with response: SearchDataResponse) {
        self.data = response
    }
    private func fireApiCall(with request: URLRequest, with completion: @escaping (Result<SearchDataResponse, ErrorResponse>) -> Void) {
        APIManager.shared.executeRequest(urlRequest: request, completion: completion)
    }
    func getSearchRequest(term: String, entity: String) -> SearchRequest{
        return SearchRequest(limit: 1, term: term, entity: entity)
    }

}
extension MainViewModel: ItemCollectionProtocol{
    func askNumberOfSection() -> Int {
        return 0
    }
    
    func askNumberOfItem(in section: Int) -> Int {
        return resResult.count ?? 0
    }
    
    /*func askData(at index: Int) -> GenericDataProtocol? {
        //guard let data = data else{return nil}
        //return data
    }*/
    
}
