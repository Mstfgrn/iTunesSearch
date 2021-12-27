//
//  MainViewDataFormatter.swift
//  HepsiBurada_CaseStudy
//
//  Created by MstfGrgn on 31.10.2021.
//

import Foundation
import UIKit
class MainViewDataFormatter  {
    
    
    
    private var componentData: SearchDataResponse?
    private var list: [Results] = [Results]()
        
    func getNumberOfSection() -> Int {
        return 1
    }
    
    func getNumbeOfItem(in section: Int) -> Int {
        let count = list.count
        return count
    }
    
    func getCount() -> Int {
        return list.count
    }
    
    func setData(with response: SearchDataResponse) {
        self.componentData = response.self
        self.componentData?.resultCount = response.resultCount
        self.list.append(contentsOf: response.results!)
    }
    
    func getItemId(at index: Int) -> Int {
        return list[index].collectionID ?? list[index].trackID!
    }
    
    
    
    
}
