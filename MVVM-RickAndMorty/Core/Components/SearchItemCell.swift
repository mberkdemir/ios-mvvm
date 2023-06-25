//
//  SearchItemCell.swift
//  MVVM-RickAndMorty
//
//  Created by Berk on 20.06.2023.
//

import UIKit

class SearchItemCell: UICollectionViewCell {
    static let reuseId = "SearchItemCell"
    
    private var characterNameLabel: UILabel!
    private var characterPosterImage: PosterImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCell()
        configureCharacterPosterImageView()
        configureCharacterNameLabelView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell(){
        layer.borderColor = UIColor.systemGray4.cgColor
        layer.borderWidth = 2.0
        layer.cornerRadius = 16
        clipsToBounds = true
    }
    
    func setCell(character: Character){
        characterNameLabel.text = character.name
        characterPosterImage.fetchImage(character: character)
    }
    
    private func configureCharacterNameLabelView(){
        characterNameLabel = UILabel(frame: .zero)
        characterNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(characterNameLabel)
        
        NSLayoutConstraint.activate([
            characterNameLabel.leadingAnchor.constraint(equalTo: characterPosterImage.trailingAnchor, constant: 10),
            characterNameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    private func configureCharacterPosterImageView(){
        characterPosterImage = PosterImageView(frame: .zero)
        characterPosterImage.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(characterPosterImage)
        
        NSLayoutConstraint.activate([
            characterPosterImage.topAnchor.constraint(equalTo: self.topAnchor),
            characterPosterImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            characterPosterImage.widthAnchor.constraint(equalToConstant: 120),
            characterPosterImage.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        characterPosterImage.image = nil
        characterPosterImage.cancelFetching()
        
        characterNameLabel.text = ""
    }
}
