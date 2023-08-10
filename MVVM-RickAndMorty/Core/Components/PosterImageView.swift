//
//  PosterImageView.swift
//  MVVM-RickAndMorty
//
//  Created by Berk on 7.05.2023.
//

import UIKit

final class PosterImageView: UIImageView {
    
    private var dataTask: URLSessionDataTask?

    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init(coder: NSCoder) {
        fatalError("Poster ImageView required init error.")
    }
    
    func fetchImage(character: Character?){
        guard let character = character else { return }
        guard let url = URL(string: character._imageUrl) else { return }
        
        dataTask = NetworkManager.shared.fetch(url: url) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
            case .failure(_):
                break
            }
            
        }
        
        dataTask?.resume()
    }
    
    func cancelFetching(){
        dataTask?.cancel()
        dataTask = nil
    }

}
