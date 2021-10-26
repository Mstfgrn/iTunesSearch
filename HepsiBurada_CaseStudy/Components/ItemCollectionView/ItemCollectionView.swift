//
//  ItemCollectionView.swift
//  HepsiBurada_CaseStudy
//
//  Created by MstfGrgn on 26.10.2021.
//

import Foundation
import UIKit

class ItemCollectionView: GenericBaseView<ItemCollectionViewData> {
    private lazy var componentCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let temp = UICollectionView(frame: .zero, collectionViewLayout: layout)
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.delegate = self
        temp.dataSource = self
        temp.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "deneme")
        return temp
    }()
    override func addMajorViewComponents() {
        addCollectionView()
    }
    func addCollectionView() {
        addSubview(componentCollectionView)
        
        NSLayoutConstraint.activate([
        
            componentCollectionView.topAnchor.constraint(equalTo: topAnchor),
            
            componentCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            componentCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            componentCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        
        
        ])
    
    }
    
}
extension ItemCollectionView: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = componentCollectionView.dequeueReusableCell(withReuseIdentifier: "deneme", for: indexPath)
        cell.backgroundColor = .black
        return cell
        
    }
}
