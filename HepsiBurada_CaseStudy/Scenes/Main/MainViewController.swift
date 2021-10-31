//
//  MainViewController.swift
//  HW3_Mustafa_Gorgun
//
//  Created by MstfGrgn on 26.10.2021.
//

import UIKit

fileprivate extension Selector{
    //static let testButtonTapped = #selector(MainViewController.testButtonAction)
}

class MainViewController: BaseViewController<MainViewModel> {
    var data2: Resultss = []
    var entityValue: String = "movie"//Default Value
    var entities = [SegmentHelper.Movies.rawValue, SegmentHelper.Music.rawValue, SegmentHelper.Apps.rawValue, SegmentHelper.Books.rawValue]
    
    private var maincomponentC: ItemCollectionView!
    
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
        self.title = "HepsiBurada"
        navigationItem.searchController = searchController
        //viewModel.fetchCars(term: "micheal jackson", entity: "movie", completion:   resultHandler)
        print(SegmentHelper.allValues)
        addCollectionView()
        print(entityValue)
        addViewModelListeners()
        viewModel.getdata(term: "apple", entity: entityValue )
    }
    
    private func addViewModelListeners() {
        viewModel.subscribeState { [weak self] state in
            switch state {
            case .loading:
                return
            case .done:
                self?.maincomponentC.reloadCollectionView()
            default:
                break
            }
        }
    }
    private func addCollectionView(){
        maincomponentC = ItemCollectionView()
        maincomponentC.translatesAutoresizingMaskIntoConstraints = false
        maincomponentC.delegate = viewModel
        view.addSubview(maincomponentC)
        
       
        NSLayoutConstraint.activate([
        
            maincomponentC.topAnchor.constraint(equalTo: view.topAnchor),
            
            maincomponentC.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            maincomponentC.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            maincomponentC.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        
        
        ])
    }
}
/*
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    private func fireCharacterListView() {
        let characterListView = CharacterListViewBuilder.builder()
        self.navigationController?.pushViewController(characterListView, animated: true)
    }
    
}*/
    
extension MainViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        entityValue = entities[selectedScope]
        if let text = searchBar.text{
            if searchBar.text!.count > 2{
                data2 = []
                self.maincomponentC.reloadCollectionView()
                viewModel.getdata(term: text, entity: entityValue)}
    }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if let text = searchBar.text{
            if searchBar.text!.count > 2{
                data2 = []
                self.maincomponentC.reloadCollectionView()
                viewModel.getdata(term: text, entity: entityValue)}
    }
    
}
}
/*extension MainViewController: ItemCollectionProtocol{
    
    func didTapButton() {
        self.navigationController?.pushViewController(SearchCellDetailController(), animated: true)
    }
    
    
}*/
