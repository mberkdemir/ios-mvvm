//
//  UICollectionView+Ext.swift
//  MVVM-RickAndMorty
//
//  Created by Berk on 13.05.2023.
//

import UIKit

extension UICollectionView {
    
    func reloadOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
