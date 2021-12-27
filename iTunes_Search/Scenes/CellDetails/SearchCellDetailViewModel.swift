//
//  SearchCellDetailViewModel.swift
//  iTunes_Search
//
//  Created by MstfGrgn on 31.10.2021.
//

import Foundation
class SearchCellDetailViewModel {
    //By specifying the data variable on init, we can push the data while calling the build() object.
    //The data variable type ItemDetailViewRequest, I can keep the data in this class on a single value with data.
    let data: ItemDetailViewRequest
    init(data: ItemDetailViewRequest){
        self.data = data
    }
}
