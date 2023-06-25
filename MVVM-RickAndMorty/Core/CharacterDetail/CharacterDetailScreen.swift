//
//  CharacterViewController.swift
//  MVVM-RickAndMorty
//
//  Created by Berk on 13.05.2023.
//

import UIKit

protocol CharacterDetailScreenInterface: AnyObject {
    func configureVC()
    func configurePosterImageView()
    func fetchPosterImage()
    func configureCharacterNameLabel()
    func configureCharacterStatusLabel()
    func configureCharacterSpeciesLabel()
    func configureCharacterGenderLabel()
}

class CharacterDetailScreen: UIViewController {
    
    let character: Character
    var viewModel = CharacterDetailViewModel()
    
    private var posterImageView: PosterImageView!
    private var characterNameLabel: CharacterDetailLabel!
    private var characterStatusLabel: CharacterDetailLabel!
    private var characterSpeciesLabel: CharacterDetailLabel!
    private var characterGenderLabel: CharacterDetailLabel!
    
    init(character: Character) {
        self.character = character
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }

}

extension CharacterDetailScreen: CharacterDetailScreenInterface {
    
    func configureVC() {
        view.backgroundColor = .systemBackground
        title = "Character Detail"
    }
    
    func configurePosterImageView() {
        posterImageView = PosterImageView(frame: .zero)
        view.addSubview(posterImageView)
        
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            posterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            posterImageView.widthAnchor.constraint(equalToConstant: .dWidth * 0.9),
            posterImageView.heightAnchor.constraint(equalToConstant: .dHeight * 0.3)
        ])
        
        posterImageView.backgroundColor = .red
    }
    
    func fetchPosterImage() {
        posterImageView.fetchImage(character: character)
    }
    
    func configureCharacterNameLabel() {
        characterNameLabel = CharacterDetailLabel(frame: .zero)
        view.addSubview(characterNameLabel)
        characterNameLabel.titleText = "Name:"
        characterNameLabel.descriptionText = character._name
        characterNameLabel.pinToBottomOfView(view: posterImageView)
    }
    
    func configureCharacterStatusLabel() {
        characterStatusLabel = CharacterDetailLabel(frame: .zero)
        view.addSubview(characterStatusLabel)
        characterStatusLabel.titleText = "Status:"
        characterStatusLabel.descriptionText = character._status
        characterStatusLabel.pinToBottomOfView(view: characterNameLabel)
    }
    
    func configureCharacterSpeciesLabel() {
        characterSpeciesLabel = CharacterDetailLabel(frame: .zero)
        view.addSubview(characterSpeciesLabel)
        characterSpeciesLabel.titleText = "Species:"
        characterSpeciesLabel.descriptionText = character._species
        characterSpeciesLabel.pinToBottomOfView(view: characterStatusLabel)
    }
    
    func configureCharacterGenderLabel() {
        characterGenderLabel = CharacterDetailLabel(frame: .zero)
        view.addSubview(characterGenderLabel)
        characterGenderLabel.titleText = "Gender:"
        characterGenderLabel.descriptionText = character._gender
        characterGenderLabel.pinToBottomOfView(view: characterSpeciesLabel)
    }
    
    
}
