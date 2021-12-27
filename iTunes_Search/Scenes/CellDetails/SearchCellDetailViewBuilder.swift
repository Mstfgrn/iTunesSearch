//
//  SearchCellDetailViewBuilder.swift
//  iTunes_Search
//
//  Created by MstfGrgn on 31.10.2021.
//

import Foundation
import UIKit
class SearchCellDetailViewBuilder {
    //created a build function to pass data during the build and to implement our controls in the push process.
    class func  build(with data: ItemDetailViewRequest)-> UIViewController{
        let viewModel = SearchCellDetailViewModel(data: data)
        return SearchCellDetailController(viewModel: viewModel)
    }
}
