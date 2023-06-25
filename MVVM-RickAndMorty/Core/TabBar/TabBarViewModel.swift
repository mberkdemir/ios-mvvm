//
//  TabBarViewModel.swift
//  MVVM-RickAndMorty
//
//  Created by Berk on 14.05.2023.
//

import Foundation


protocol TabBarViewModelInterface {
    var view: TabBarInterface? { get set }
    func viewDidLoad()
}

class TabBarViewModel {
    weak var view: TabBarInterface?
}

extension TabBarViewModel: TabBarViewModelInterface {
    
    func viewDidLoad() {
        view?.setUpTabItems()
        view?.configureTab()
    }
}
