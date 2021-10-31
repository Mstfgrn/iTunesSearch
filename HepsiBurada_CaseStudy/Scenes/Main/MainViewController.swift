//
//  MainViewController.swift
//  HW3_Mustafa_Gorgun
//
//  Created by MstfGrgn on 26.10.2021.
//

import UIKit
import DefaultNetworkOperationPackage
fileprivate extension Selector{
    //static let testButtonTapped = #selector(MainViewController.testButtonAction)
}
class MainViewController: BaseViewController<MainViewModel> {
    //private var dataResponse: [SearchDataResponseS]?
    //private var serviceRequestModel = ServiceRequestModel()
   // private var maincomponentC: ItemCollectionView!
    let cellId = "deneme"
        private var resulTT = [Results]()
        var data: SearchDataResponse?
        //private var resResult = [Results?]()
        //var data2: Resultss = []

    //let searchBar = UISearchBar()
    //private var searchControllerComponent = UISearchController(searchResultsController: nil)
    /*private lazy var test: UIButton = {
        let temp = UIButton(type: .system)
        temp.addTarget(self, action: .testButtonTapped, for: .touchUpInside)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.setTitle("PUSH", for: .normal)
        //temp.setTitleColor(.black, for: .normal)
        //temp.setTitle("DOWN", for: .disabled)
        return temp
    }()*/
    private lazy var componentCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let temp = UICollectionView(frame: .zero, collectionViewLayout: layout)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.delegate = self
        temp.dataSource = self
        temp.register(SearcViewCell.self, forCellWithReuseIdentifier: cellId)
        return temp
    }()
    lazy var searchController: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
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
        //fetchSearch()
        addCollectionView()
        //viewModel.getdata()
        getdata()

    }    
    func getdata(){
        do{
            guard let urlRequest = try? ServiceProvider(request: getSearchRequest(term: "Apple", entity: "movie")).returnUrlRequest() else {return}
            fireApiCall(with: urlRequest) { [weak self] result in
                switch result{
                case .failure(let error):
                    print("error: \(error)")
                case .success(let response):
                    self?.data = response
                    self?.resulTT = response.results!
                    print("REEEE: \(self?.resulTT)")
                    //print(self?.data ?? "data" )
                    //print("response: \(response)")
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
    
    private func addCollectionView(){
        view.addSubview(componentCollectionView)
        
       
        NSLayoutConstraint.activate([
        
            componentCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            
            componentCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            componentCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            componentCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        
        
        ])
    
    }
    //Test Func calls TestViewController, which is a new type of controller for testing dthe button of action.
    //Window -> NavigationController ->MainViewController(This Class) -> Button -> TestViewController
    /*@objc func testButtonAction(_ sender: UIButton){
        print("Push Pressed ")
        fireCharacterListView()
        //let viewController = TestViewController()
        //viewController.title = "MainViewController"
        //Navigation Controller include array component [0,1,2,3,]
        //self.navigationController?.viewControllers -> this component can many viewController
        //self.navigationController?.popToViewController(UIViewController, animated: Bool) -> Thanks to the popviewController function, we can choose the index we want among the indexes.
       // let navigationMainViewController = UINavigationController(rootViewController: viewController)
        //navigationMainViewController.navigationBar.backgroundColor = .red
        //self.navigationController?.pushViewController(viewController , animated: true)
        //self.present(navigationMainViewController, animated: true, completion: nil) //-> This different of presentation like a permission page on week2
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    private func fireCharacterListView() {
        let characterListView = CharacterListViewBuilder.builder()
        self.navigationController?.pushViewController(characterListView, animated: true)
    }*/
    
}
extension MainViewController: UISearchBarDelegate, UISearchResultsUpdating{
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
         
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return resulTT.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = componentCollectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearcViewCell
        //cell.backgroundColor = .black
        let resultarr = resulTT[indexPath.item]
        cell.resResult = resultarr
        componentCollectionView.reloadData()
        cell.layer.cornerRadius = 12
        return cell
        
    }
    
}
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (UIScreen.main.bounds.width - 40) / 2
        return CGSize(width: width, height: 250)
    }
}
/*extension MainViewController: ItemCollectionProtocol{
    
    func didTapButton() {
        self.navigationController?.pushViewController(SearchCellDetailController(), animated: true)
    }
    
    
}*/
