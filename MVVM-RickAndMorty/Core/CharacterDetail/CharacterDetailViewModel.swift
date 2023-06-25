//
//  CharacterDetailViewModel.swift
//  MVVM-RickAndMorty
//
//  Created by Berk on 14.05.2023.
//

import Foundation


protocol CharacterDetailViewModelInterface {
    var view: CharacterDetailScreenInterface? { get set}
    func viewDidLoad()
}

final class CharacterDetailViewModel {
    weak var view: CharacterDetailScreenInterface?
}

extension CharacterDetailViewModel: CharacterDetailViewModelInterface {
    
    func viewDidLoad() {
        view?.configureVC()
        view?.configurePosterImageView()
        view?.fetchPosterImage()
        view?.configureCharacterNameLabel()
        view?.configureCharacterStatusLabel()
        view?.configureCharacterSpeciesLabel()
        view?.configureCharacterGenderLabel()
    }
}
