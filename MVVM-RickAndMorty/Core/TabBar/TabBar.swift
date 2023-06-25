//
//  UITabBarViewController.swift
//  MVVM-RickAndMorty
//
//  Created by Berk on 14.05.2023.
//

import UIKit

protocol TabBarInterface: AnyObject {
    func setUpTabItems()
    func configureTab()
}

class TabBar: UITabBarController {
    private let viewModel = TabBarViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.view = self
        viewModel.viewDidLoad()
    }
}

extension TabBar: TabBarInterface {
    func setUpTabItems(){
        let homeScreen = HomeScreen()
        let searchScreen = SearchScreen()
        
        
        let nav1 = UINavigationController(rootViewController: homeScreen)
        let nav2 = UINavigationController(rootViewController: searchScreen)
        
        nav1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "person.2.fill"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 2)
        
        
        setViewControllers([nav1,nav2], animated: true)
    }
    
    func configureTab() {
        self.tabBar.tintColor = .white
    }
}
