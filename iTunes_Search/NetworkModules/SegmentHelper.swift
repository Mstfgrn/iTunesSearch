//
//  SegmentHelper.swift
//  iTunes_Search
//
//  Created by MstfGrgn on 31.10.2021.
//

import Foundation
enum SegmentHelper: String {
    // The enum structure that takes the string of the elements in the entity array I use in the MainViewController.
     case Movies = "movie", Music = "song", Apps = "software", Books = "audiobook"

     static let allValues = [Movies, Music, Apps, Books]
    
}
