//
//  MainViewBuilder.swift
//  HW3_Mustafa_Gorgun
//
//  Created by MstfGrgn on 10.10.2021.
//

import UIKit

class MainViewBuilder {
    class func build() -> UIViewController {
        let viewModel = MainViewModel()
        let viewController = MainViewController(viewModel: viewModel)
        let navigationViewController = UINavigationController(rootViewController: viewController)
        //viewController.title = "HepsiBurada"
        
        //viewController.navigationController?.setNavigationBarHidden(true, animated: false)
        //return viewController
        return navigationViewController
    }
}
