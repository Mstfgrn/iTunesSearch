//
//  FontManager.swift
//  HepsiBurada_CaseStudy
//
//  Created by MstfGrgn on 26.10.2021.
//

import UIKit

enum FontManager: GenericValueProtocol {
    //Thanks to the font manager, it allows me to easily get the font I want during my design on UIview.
    typealias Value = UIFont
    
    var value: UIFont {
        switch self {
        case .bold(let size):
            return UIFont.boldSystemFont(ofSize: size)
            
        case .regular(let size):
            return UIFont.systemFont(ofSize: size, weight: .regular)
        }
    }
    
    case bold(CGFloat)
    case regular(CGFloat)
}
