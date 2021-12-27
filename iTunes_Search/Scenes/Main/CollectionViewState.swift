//
//  CollectionViewState.swift
//  HepsiBurada_CaseStudy
//
//  Created by MstfGrgn on 30.10.2021.
//

import Foundation
typealias CollectionViewStateBlock = (CollectionViewState) -> Void

enum CollectionViewState {
    
    case loading
    case done
    case failure
    
}
