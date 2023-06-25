//
//  UIHelpter.swift
//  MVVM-RickAndMorty
//
//  Created by Berk on 6.05.2023.
//

import UIKit

enum UIHelper{
    static func createHomeFlowLayout() -> UICollectionViewFlowLayout  {
        let layout = UICollectionViewFlowLayout()
        let itemWidth = CGFloat.dWidth
        
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.5)
        layout.minimumLineSpacing = 40
        
        return layout
    }
    
    static func createSearchFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let itemWidth = CGFloat.dWidth
        
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth * 0.4)
        layout.minimumLineSpacing = 20
        
        return layout
    }
}
