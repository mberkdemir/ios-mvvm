//
//  CharacterViewCell.swift
//  MVVM-RickAndMorty
//
//  Created by Berk on 6.05.2023.
//

import UIKit

final class CharacterCell: UICollectionViewCell {
    static let reuseId = "CharacterCell"
    
    private var posterImageView: PosterImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCell()
        configurePosterImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCell(){
        backgroundColor = .systemGray
        layer.cornerRadius = 16
        clipsToBounds = true // Subviewları parent corner radius'a göre kırpar.
    }
    
    private func configurePosterImageView(){
        posterImageView = PosterImageView(frame: .zero)
        addSubview(posterImageView)
        
        posterImageView.pinToEdgeOf(view: self)
    }
    
    func setCell(character: Character){
        posterImageView.fetchImage(character: character)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        posterImageView.image = nil
        posterImageView.cancelFetching()
    }
}
