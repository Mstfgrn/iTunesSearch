//
//  MainViewController.swift
//  HW3_Mustafa_Gorgun
//
//  Created by MstfGrgn on 10.10.2021.
//

import UIKit

fileprivate extension Selector{
    //static let testButtonTapped = #selector(MainViewController.testButtonAction)
}

class MainViewController: BaseViewController<MainViewModel> {
    
    private var maincomponentC: ItemCollectionView!
    /*private lazy var test: UIButton = {
        let temp = UIButton(type: .system)
        temp.addTarget(self, action: .testButtonTapped, for: .touchUpInside)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.setTitle("PUSH", for: .normal)
        //temp.setTitleColor(.black, for: .normal)
        //temp.setTitle("DOWN", for: .disabled)
        return temp
    }()*/
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        view.backgroundColor = .green
        self.title = "HepsiBurada"
        addCollectionView()
    }
    private func addCollectionView(){
        maincomponentC = ItemCollectionView()
        maincomponentC.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(maincomponentC)
       
        NSLayoutConstraint.activate([
        
            maincomponentC.topAnchor.constraint(equalTo: view.topAnchor),
            
            maincomponentC.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            maincomponentC.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            
            maincomponentC.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        
        
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
