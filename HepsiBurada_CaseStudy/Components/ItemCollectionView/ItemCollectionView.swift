//
//  ItemCollectionView.swift
//  HepsiBurada_CaseStudy
//
//  Created by MstfGrgn on 26.10.2021.
//

import Foundation
import UIKit

class ItemCollectionView: GenericBaseView<ItemCollectionViewData> {
    let cellId = "cellId"
    weak var delegate : ItemCollectionProtocol?
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
    func reloadCollectionView(){
        DispatchQueue.main.async {
            self.componentCollectionView.reloadData()
        }
        
    }

    
}
extension ItemCollectionView: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate?.askNumberOfItem(in: section) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //guard let data = delegate?.askData(at: indexPath.row) else{fatalError("Data Invalid")}
        let cell = componentCollectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearcViewCell
        //cell.backgroundColor = .black
        cell.layer.cornerRadius = 12
        guard let resuResult = delegate?.askData(at: indexPath.row) else{return UICollectionViewCell()}
        //print("Response:\(resuResult)")
        cell.configure(res: resuResult)
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.isUserInteractionEnabled = false
        cell?.startTappedAnimation(with: { [weak self] finish in
            if finish {
                self?.delegate?.selectedItem(at: indexPath.row)
                cell?.isUserInteractionEnabled = true
            }
        })
    }
    
}
extension ItemCollectionView: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (UIScreen.main.bounds.width - 40) / 2
        return CGSize(width: width, height: 250)
    }
}

