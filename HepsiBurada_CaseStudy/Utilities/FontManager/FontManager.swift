//
//  FontManager.swift
//  HepsiBurada_CaseStudy
//
//  Created by MstfGrgn on 26.10.2021.
//

import UIKit

enum FontManager: GenericValueProtocol {
    
    typealias Value = UIFont
    
    var value: UIFont {
        switch self {
        case .bold(let size):
            return UIFont.systemFont(ofSize: size, weight: .bold)
            
        case .regular(let size):
            return UIFont.systemFont(ofSize: size, weight: .regular)
        }
    }
    
    case bold(CGFloat)
    case regular(CGFloat)
}
