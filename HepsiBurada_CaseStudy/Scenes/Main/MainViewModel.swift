//
//  MainViewModel.swift
//  HW3_Mustafa_Gorgun
//
//  Created by MstfGrgn on 26.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage
typealias SearchCompletionBlock = (SearchDataResponse) -> Void
typealias SearchResultBlock = (Result<SearchDataResponse, ErrorResponse>) -> Void
class MainViewModel{
    //private var dataFormatter: MainViewDataFormatter

    var data: SearchDataResponse?
    private var state: CollectionViewStateBlock?
    private var resResult = [Results?]()
    var data2: Resultss = []
    
    func subscribeState(completion: @escaping CollectionViewStateBlock) {
        state = completion
    }
    func getdata(term: String, entity: String){
        do{
            guard let urlRequest = try? ServiceProvider(request: getSearchRequest(term: term, entity: entity)).returnUrlRequest() else {return}
            state?(.loading)
            fireApiCall(with: urlRequest) { [weak self] result in
                switch result{
                case .failure(let error):
                    print("error: \(error)")
                case .success(let response):
                    self?.data2 = response.results!
                    self?.resResult = response.results!
                    //print("responseEEEEE: \(self?.resResult)")
                    
                    //print(self?.data ?? "data" )
                    //print("response: \(response)")
                }
                self?.state?(.done)
            }
        }
    }
   
    /*private func apiCallHandler(from response: SearchDataResponse) {
        dataFormatter.setData(with: response)
        state?(.done)
    }*/
    private func fireApiCall(with request: URLRequest, with completion: @escaping (Result<SearchDataResponse, ErrorResponse>) -> Void) {
        APIManager.shared.executeRequest(urlRequest: request, completion: completion)
    }
    func getSearchRequest(term: String, entity: String) -> SearchRequest{
        return SearchRequest(limit: 20, term: term, entity: entity)
    }

}
extension MainViewModel: ItemCollectionProtocol{
    
    func askData(at index: Int) -> Results? {
        return data2[index]
    }
    
    /*func askData(at index: Int) -> [Results]? {
        return data?.results
    }*/
    
    func askNumberOfSection() -> Int {
        return 0
    }
    
    func askNumberOfItem(in section: Int) -> Int {
        return data2.count
        // return dataFormatter.getNumbeOfItem(in: section)
    }
    
}
