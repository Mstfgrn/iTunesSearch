//
//  SearcViewCell.swift
//  HepsiBurada_CaseStudy
//
//  Created by MstfGrgn on 29.10.2021.
//

import Foundation
import UIKit
class SearcViewCell: UICollectionViewCell {
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [collectionName,collectionPrice,releaseDate])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.alignment = .center
        //temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = 5
        return temp
    }()
    private lazy var imageViewComponent: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        //temp.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //temp.widthAnchor.constraint(equalToConstant: 50).isActive = true
        temp.image = UIImage(named: "notif_")
        
        temp.layer.cornerRadius = 12
        temp.clipsToBounds = true
        temp.contentMode = .scaleToFill
        //temp.layer.shadowColor = UIColor.black.cgColor
       // temp.layer.shadowOffset = CGSize(width: 0, height: 2)
        //temp.layer.shadowRadius = 4
        //temp.layer.shadowOpacity = 0.6
        return temp
    }()
    
    private lazy var collectionName: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.text = "I Love Michael Jackson edition"
        temp.font = FontManager.bold(12).value
        temp.numberOfLines = 2
        temp.textColor = .black
        return temp
    }()
    private lazy var collectionPrice: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.text = "collectionPrice"
        temp.font = FontManager.regular(12).value
        temp.numberOfLines = 2
        temp.textColor = .black
        return temp
    }()
    private lazy var releaseDate: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.text = "releaseDate"
        temp.font = FontManager.regular(12).value
        temp.numberOfLines = 0
        temp.textColor = .black
        return temp
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray
        addUserComponents()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func addUserComponents() {
        addSubview(imageViewComponent)
        addSubview(mainStackView)

        imageViewComponent.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 10, bottom: 0, right: 10), size: .init(width: 150, height: 150))
        mainStackView.anchor(top: imageViewComponent.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 10, bottom: 0, right: 10), size: .init())
        
        
    }
}
