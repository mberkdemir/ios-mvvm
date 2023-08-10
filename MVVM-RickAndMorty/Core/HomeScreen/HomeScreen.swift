//
//  HomeScreen.swift
//  MVVM-RickAndMorty
//
//  Created by Berk on 6.05.2023.
//

import UIKit

protocol HomeScreenInterface: AnyObject {
    func configureVC()
    func configureCollectionView()
    func reloadCollectionView()
    func navigateToCharacterDetail(character: Character)
}

final class HomeScreen: UIViewController {
    
    private let viewModel = HomeViewModel()
    private var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.view = self
        viewModel.viewDidLoad()
    }
}

extension HomeScreen: HomeScreenInterface {
    
    func configureVC() {
        view.backgroundColor = .systemBackground
        title = "Home"
    }
    
    func configureCollectionView() {
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createHomeFlowLayout())
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CharacterCell.self, forCellWithReuseIdentifier: CharacterCell.reuseId)
        collectionView.pinToEdgeOf(view: view)
    }
    
    func reloadCollectionView() {
        collectionView.reloadOnMainThread()
    }
    
    func navigateToCharacterDetail(character: Character) {
        DispatchQueue.main.async {
            let detailPageViewModel = CharacterDetailViewModel()
            detailPageViewModel.character = character
            let detailPage = CharacterDetailScreen(viewModel: detailPageViewModel)
            self.navigationController?.pushViewController(detailPage, animated: true)
        }
    }
}

extension HomeScreen: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCell.reuseId, for: indexPath) as! CharacterCell
        cell.setCell(character: viewModel.characters[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.openCharacterDetailPage(character: viewModel.characters[indexPath.item])
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeigth = scrollView.contentSize.height
        let height = scrollView.frame.size.height
                
        if offsetY >= contentHeigth - (2 * height) {
            viewModel.getCharacters()
        }
    }
    
    
}
