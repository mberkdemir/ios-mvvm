//
//  UIView+Ext.swift
//  MVVM-RickAndMorty
//
//  Created by Berk on 6.05.2023.
//

import UIKit


extension UIView {
    func pinToEdgeOf(view: UIView){
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: view.topAnchor),
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func pinToBottomOfView(view: UIView) {
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 10),
            self.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
    }
}
