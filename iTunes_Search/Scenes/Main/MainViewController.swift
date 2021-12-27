//
//  MainViewController.swift
//  HW3_Mustafa_Gorgun
//
//  Created by MstfGrgn on 26.10.2021.
//

import UIKit

class MainViewController: BaseViewController<MainViewModel> {
    var entityValue: String = "movie"//Default Value
    
    //The entity variable scopbuttontitle(when switching between segments) It keeps the entity words that I need to enter as parameters when I make APICall in a string.
    var entities = [SegmentHelper.Movies.rawValue, SegmentHelper.Music.rawValue, SegmentHelper.Apps.rawValue, SegmentHelper.Books.rawValue]
    
    private var maincomponentC: ItemCollectionView!//It contains the collectionView structure that will hold the items in the UIview Class, which I did not initialize.
    
    lazy var searchController: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Search"
        search.searchBar.sizeToFit()
        search.searchBar.searchBarStyle = .prominent
        search.searchBar.scopeButtonTitles = ["Movies","Music","Apps","Books"]
        //movie = movie, music = musicVideo song, apps = software, book = audiobook
        search.searchBar.delegate = self
        return search
    }()
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        view.backgroundColor = .green
        self.title = "iTunes Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.hidesBarsOnSwipe = true;
        navigationItem.searchController = searchController
        //viewModel.fetchCars(term: "micheal jackson", entity: "movie", completion:   resultHandler)
        addCollectionView()
        addViewModelListeners()
        viewModel.getdata(term: "apple", entity: entityValue ) //default ApıCall For Movie
    }
    
    private func addViewModelListeners() {
        viewModel.subscribeState { [weak self] state in
            switch state {
            case .loading:
                return
            case .done:
                self?.maincomponentC.reloadCollectionView()//The function where I reload the collectionView after the call is over.
            default:
                break
            }
        }
        viewModel.subscribeDetailViewState {[weak self] data in
            self?.fireDetail(with: data)
        }
    }
    
    private func fireDetail(with data: ItemDetailViewRequest){
        
        let detailViewController = SearchCellDetailViewBuilder.build(with: data)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    private func addCollectionView(){
        //I create the object of the ItemCollectionView structure and determine it on the controller with the necessary constraints.
        maincomponentC = ItemCollectionView()
        maincomponentC.translatesAutoresizingMaskIntoConstraints = false
        maincomponentC.delegate = viewModel
        //I specify that the Delegation of the ItemCollectionProtocol type that I defined in the ItemCollectionView class should listen to the ViewModel on the controller. Thanks to this, I will be able to access the data in the view model on this delegation and pass it to the UIview Component, which is independent of the model and controller.
        view.addSubview(maincomponentC)
        
        
        NSLayoutConstraint.activate([
            
            maincomponentC.topAnchor.constraint(equalTo: view.topAnchor),
            
            maincomponentC.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            maincomponentC.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            maincomponentC.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
            
        ])
    }
}

extension MainViewController: UISearchBarDelegate{
   // Thanks to these two searchBar methods, I make an APICall in one according to each character change on the text, and in the other according to the segment change with this text. Before every APICall I make, I reset the Data2 array that I keep in the incoming Response on the MainViewModel. In this way, it does not create a disadvantage for memory.
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        entityValue = entities[selectedScope]
        if let text = searchBar.text{
            if searchBar.text!.count > 2{
                viewModel.data2 = []
                self.maincomponentC.reloadCollectionView()
                viewModel.getdata(term: text, entity: entityValue)}
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let text = searchBar.text{
            if searchBar.text!.count > 2{
                viewModel.data2 = []
                self.maincomponentC.reloadCollectionView()
                viewModel.getdata(term: text, entity: entityValue)}
        }
    }
}
