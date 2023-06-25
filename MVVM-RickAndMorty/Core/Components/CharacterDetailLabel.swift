//
//  CharacterDetailLabel.swift
//  MVVM-RickAndMorty
//
//  Created by Berk on 14.05.2023.
//

import UIKit

class CharacterDetailLabel: UILabel {
    
    var titleText: String?
    var descriptionText: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        configureLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 8

        let titleLabel = UILabel()
        titleLabel.text = titleText
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        stackView.addArrangedSubview(titleLabel)

        let descriptionLabel = UILabel()
        descriptionLabel.text = descriptionText
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
        stackView.addArrangedSubview(descriptionLabel)

        addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configureLabel(){
        self.font = .systemFont(ofSize: 18)
        self.textColor = .white
    }

}
