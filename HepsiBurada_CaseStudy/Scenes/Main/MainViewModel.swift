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
    
    private var detailViewState: ItemDetailRequestBlock?
    var data: Results?
    private var state: CollectionViewStateBlock?
    private var resResult = [Results?]()
    var data2: Resultss = []//I created an array of this type because I want to get the Result struct data in SearcDataResponse.
    
    func subscribeState(completion: @escaping CollectionViewStateBlock) {
        state = completion
    }
    
    //In the array I created, I threw the return response value after APICall. I made this Result struct response.result because it is located under SearchDataResponse. The reason it came in this type was that the data I wanted the comp block in APICall to return was SearchDataResponse.
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
                    //self?.data = response.results!
                    //print("responseEEEEE: \(self?.resResult)")
                    
                    //print(self?.data ?? "data" )
                    //print("response: \(response)")
                }
                self?.state?(.done)
            }
        }
    }
    func subscribeDetailViewState(with completion: @escaping  ItemDetailRequestBlock) {
        detailViewState = completion
    }
    private func fireApiCall(with request: URLRequest, with completion: @escaping (Result<SearchDataResponse, ErrorResponse>) -> Void) {
        APIManager.shared.executeRequest(urlRequest: request, completion: completion)
    }
    //I created a function using the inits I made in the SearchRequest Class here. The parameters I created allowed me to get a UrlRequest by sitting on these inits.
    func getSearchRequest(term: String, entity: String) -> SearchRequest{
        return SearchRequest(limit: 20, term: term, entity: entity)
    }

}
extension MainViewModel: ItemCollectionProtocol{
    
    func askData(at index: Int) -> Results? {
        return data2[index]
    }
    
    func askNumberOfSection() -> Int {
        return 0
    }
    
    func askNumberOfItem(in section: Int) -> Int {
        return data2.count
        
    }
    //Along with the selectedItem, I get the index of the selected item in both the collectionView. In addition, I pass data with the DetailStateBlock, which I defined here, in the detail of the Cell selected with the respondaki index that comes after APICall in the Model. This is the data type I used in the data build function I passed. Thus, the ItemDetailView component, which is independent of the controller and the model, is aware of the SearchCellDetailController.
    func selectedItem(at index: Int) {
        print("index : \(index)")
        detailViewState?(ItemDetailViewRequest(imageUrl: data2[index].artworkUrl100!, name: data2[index].collectionName ?? data2[index].trackName!, price: data2[index].collectionPrice ?? 0, detail: data2[index].resultDescription ?? data2[index].longDescription ?? data2[index].shortDescription ?? "There is No Description"  ))
    }
}
