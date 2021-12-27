//
//  SearchCellDetailController.swift
//  iTunes_Search
//
//  Created by MstfGrgn on 28.10.2021.
//

import UIKit
class SearchCellDetailController: BaseViewController<SearchCellDetailViewModel> {
    //This controller structure is the viewController that will be displayed when the cell on the CollectionView is clicked.
    
    private var detailcomponent: ItemDetailView!//By calling another UIview Component even though it is not initialized yet, we avoid the complex design structure.

    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        view.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = .black
        addDetailView()
        detailcomponent.configure(imageUrl: viewModel.data.imageUrl, name: viewModel.data.name, price: viewModel.data.price, detail: viewModel.data.detail) //In this part, we pass data to the ItemDetail structure with the configure function in the component we inject.
    }
    
    private func addDetailView(){
        //With the addDetailView function, we define the constraints by initing the component that is not init in the upper part that we created in it.
        detailcomponent = ItemDetailView()
        detailcomponent.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(detailcomponent)
        
        
        NSLayoutConstraint.activate([
            
            detailcomponent.topAnchor.constraint(equalTo: view.topAnchor),
            
            detailcomponent.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            detailcomponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            detailcomponent.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
            
        ])
    }
}
