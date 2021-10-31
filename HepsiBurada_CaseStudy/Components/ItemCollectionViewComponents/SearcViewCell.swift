//
//  SearcViewCell.swift
//  HepsiBurada_CaseStudy
//
//  Created by MstfGrgn on 29.10.2021.
//

import Foundation
import UIKit
class SearcViewCell: UICollectionViewCell {
   
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.cornerRadius = 12
        temp.clipsToBounds = true
        //temp.layer.borderColor = UIColor.black.cgColor
        //temp.layer.borderWidth = 0.5
        temp.layer.shadowColor = UIColor.black.cgColor
        temp.layer.shadowOffset = CGSize(width: 0, height: 2)
        temp.layer.shadowRadius = 4
        temp.layer.shadowOpacity = 0.6
        temp.layer.masksToBounds = false

        return temp
    }()
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [collectionName,collectionPrice,releaseDate])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.alignment = .center
        temp.axis = .vertical
        temp.spacing = 5
        return temp
    }()
    private lazy var imageViewComponent: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.image = UIImage(named: "notif_")
        temp.layer.cornerRadius = 12
        temp.clipsToBounds = true
        temp.contentMode = .scaleAspectFit
        temp.layer.shadowColor = UIColor.black.cgColor
        temp.layer.shadowOffset = CGSize(width: 0, height: 2)
        temp.layer.shadowRadius = 4
        temp.layer.shadowOpacity = 0.6
        return temp
    }()
    
    private lazy var collectionName: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = FontManager.bold(12).value
        temp.numberOfLines = 2
        temp.textAlignment = .center
        temp.textColor = .black
        return temp
    }()
    private lazy var collectionPrice: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = FontManager.regular(12).value
        temp.numberOfLines = 0
        temp.textAlignment = .center
        temp.textColor = .black
        return temp
    }()
    private lazy var releaseDate: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.font = FontManager.regular(12).value
        temp.textAlignment = .center
        temp.numberOfLines = 0
        temp.textColor = .black
        return temp
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addUserComponents()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func addUserComponents() {
        addSubview(containerView)
        containerView.addSubview(imageViewComponent)
        containerView.addSubview(mainStackView)
        
        containerView.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right:0  ), size: .init())
        imageViewComponent.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 10, left: 18, bottom: 0, right:0  ), size: .init(width: 150, height: 150))
        mainStackView.anchor(top: imageViewComponent.bottomAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 10, left: 3, bottom: 0, right: 3), size: .init())
        
        
    }
    func configure(res: Results) {
        imageViewComponent.load(url: URL(string: res.artworkUrl100!)!)
        collectionName.text  = res.collectionName ?? res.trackName
        collectionPrice.text = "$\(res.collectionPrice ?? 0)"
        releaseDate.text = convertDate(res: res.releaseDate)
        }
    // MARK: - RELEASEDATE
    
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
    
}
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
