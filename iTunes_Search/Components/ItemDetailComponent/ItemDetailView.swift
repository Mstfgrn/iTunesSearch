//
//  ItemDetailView.swift
//  iTunes_Search
//
//  Created by MstfGrgn on 29.10.2021.
//

import UIKit
import Foundation

class ItemDetailView: GenericBaseView<ItemDetailViewData> {
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        //temp.layer.cornerRadius = 12
        temp.clipsToBounds = true
        temp.layer.borderColor = UIColor.black.cgColor
        //temp.layer.borderWidth = 0.5
        temp.layer.shadowColor = UIColor.black.cgColor
        temp.layer.shadowOffset = CGSize(width: 0, height: 2)
        temp.layer.shadowRadius = 4
        temp.layer.shadowOpacity = 0.6
        temp.layer.masksToBounds = false
        
        return temp
    }()
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [collectionName,collectionPrice])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.alignment = .leading
        temp.axis = .vertical
        temp.spacing = 10
        return temp
    }()
    private lazy var imageViewComponent: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.image = UIImage(named: "Rectangle")
        //temp.layer.cornerRadius = 12
        temp.clipsToBounds = true
        temp.contentMode = .scaleToFill
        temp.layer.shadowColor = UIColor.black.cgColor
        temp.layer.shadowOffset = CGSize(width: 0, height: 2)
        temp.layer.shadowRadius = 4
        temp.layer.shadowOpacity = 0.6
        return temp
    }()
    
    private lazy var collectionName: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = FontManager.bold(25).value
        temp.text = "I love James Hunt Stories"
        temp.numberOfLines = 2
        temp.textAlignment = .center
        temp.textColor = .black
        return temp
    }()
    private lazy var collectionPrice: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = FontManager.regular(23).value
        temp.numberOfLines = 0
        temp.text = "$40"
        temp.textAlignment = .center
        temp.textColor = .black
        return temp
    }()
    let resultDesc: UITextView = {
        let temp = UITextView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = FontManager.regular(20).value
        temp.textAlignment = .left
        temp.isEditable = false
        temp.backgroundColor = .white
        temp.textColor = .black
        return temp
    }()
    override func addMajorViewComponents() {
        addUserComponents()
    }
    private func addUserComponents() {
        addSubview(containerView)
        containerView.addSubview(imageViewComponent)
        containerView.addSubview(mainStackView)
        addSubview(resultDesc)
        
        containerView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right:0  ), size: .init())
        imageViewComponent.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 85, bottom: 0, right: 0 ), size: .init(width: 250 , height: 250))
        mainStackView.anchor(top: imageViewComponent.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 23, bottom: 0, right: 3), size: .init())
        resultDesc.anchor(top: mainStackView.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 18, bottom: 0, right: 10), size: .init(width: 380, height: 450))
        
        
    }
    func configure(imageUrl: String, name: String, price: Double, detail: String) {
        imageViewComponent.load(url: URL(string: imageUrl)!)
        collectionName.text  = name
        collectionPrice.text = "$\(price)"
        resultDesc.text = detail
    }
    /*
    func convertDate(res: String) -> String{
        var resultTime = ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        if let date = dateFormatter.date(from: res) {
            dateFormatter.dateFormat = "MMM dd yyyy"
            resultTime = dateFormatter.string(from: date)
        }
        return resultTime
    }
    */
        
}

