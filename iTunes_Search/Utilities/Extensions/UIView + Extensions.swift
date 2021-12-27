//
//  UIView + Extensions.swift
//  iTunes_Search
//
//  Created by MstfGrgn on 1.11.2021.
//
import UIKit

extension UIView {
    
    //I created this animation extention to give an animation when user clicks on cells on collectionView.
    func startTappedAnimation(with completion: @escaping (Bool) -> Void) {
        
        transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 6.0, options: .allowUserInteraction, animations: {
            self.transform = CGAffineTransform.identity
        }, completion: completion)
        
        self.layoutIfNeeded()
        
    }
    
}
