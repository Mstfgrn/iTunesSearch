//
//  MainViewBuilder.swift
//  iTunes_Search
//
//  Created by MstfGrgn on 26.10.2021.
//

import UIKit

class MainViewBuilder {
    class func build() -> UIViewController {
        let viewModel = MainViewModel()
        let viewController = MainViewController(viewModel: viewModel)
        let navigationViewController = UINavigationController(rootViewController: viewController)
        return navigationViewController
    }
}
