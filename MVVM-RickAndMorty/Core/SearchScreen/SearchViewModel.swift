//
//  LocationViewController.swift
//  MVVM-RickAndMorty
//
//  Created by Berk on 14.05.2023.
//

import Foundation

protocol SearchViewModelInterface {
    var view: SearchScreenInterface? { get set}
    func viewDidLoad()
}

class SearchViewModel {
    weak var view: SearchScreenInterface?
    
    private let service = CharacterService()
    var filteredCharacters: [Character] = []
    let searchTimeout: TimeInterval = 1
    var searchText: String = ""
    
    
}

extension SearchViewModel: SearchViewModelInterface {
    
    func viewDidLoad() {
        view?.configureVC()
        view?.configureTextField()
        view?.configureCollectionView()
    }
    
    func performSearch(searchText: String) {
        service.fetchFilteredCharacters(name: searchText) { [weak self] characters in 
            guard let self = self else { return }
            guard let filteredCharacters = characters else { return }
            self.updateQueryResult(characters: filteredCharacters)
            self.updateSearchCollectionView()
        }
    }
    
    func updateQueryResult(characters: [Character]){
        self.filteredCharacters = characters
    }
    
    func updateSearchCollectionView(){
        view?.reloadCollectionView()
    }
    
    func openCharacterDetailPage(character: Character){
        view?.navigateToCharacterDetailPage(character: character)
    }
}
