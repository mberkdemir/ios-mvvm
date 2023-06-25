//
//  HomeViewModel.swift
//  MVVM-RickAndMorty
//
//  Created by Berk on 6.05.2023.
//

import Foundation

protocol HomeViewModelInterface {
    var view: HomeScreenInterface? { get set }
    
    func viewDidLoad()
    func getCharacters()
}

final class HomeViewModel {
    weak var view: HomeScreenInterface?
    private let service = CharacterService()
    var characters: [Character] = []
    private var pageIndex: Int = 1
    private var totalPages: Int = 1
}

extension HomeViewModel: HomeViewModelInterface {
    
    
    func viewDidLoad() {
        view?.configureVC()
        view?.configureCollectionView()
        getCharacters()
        setTotalPages()
    }
    
    func getCharacters() {
        service.fetchCharacters(page: pageIndex) { [weak self] returnedCharacters in
            guard let self = self else { return }
            guard let returnedCharacters = returnedCharacters else { return }
            self.updateCharacters(character: returnedCharacters)
        }
    }
    
    func openCharacterDetailPage(character: Character) {
        view?.navigateToCharacterDetail(character: character)
    }
    
    private func setTotalPages() {
        guard let totalPageCount = service.getPageCount() else { return }
        self.totalPages = totalPageCount
    }
    
    private func updateCharacters(character: [Character]) {
        if self.totalPages <= self.pageIndex {
            self.characters.append(contentsOf: character)
            self.view?.reloadCollectionView()
            self.pageIndex += 1
        }
    }
}
