//
//  CharacterService.swift
//  MVVM-RickAndMorty
//
//  Created by Berk on 6.05.2023.
//

import Foundation

final class CharacterService{
    
    private var totalPages: Int? = 1
    
    func fetchCharacters(page: Int, completion: @escaping ([Character]?) -> ()) {
        guard let url = URL(string: APIURLs.characters(page: page)) else { return }
        
        NetworkManager.shared.fetch(url: url) { [weak self] result in
            guard let self = self else { return }
            
            switch result{
            case .success(let data):
                completion(self.handleWithData(data: data))
            case .failure(let error):
                self.handleWithError(error: error)
            }
        }
    }
    
    func fetchFilteredCharacters(name: String, completion: @escaping ([Character]?) -> ()) {
        guard let url = URL(string: APIURLs.filterCharacters(name: name)) else { return }
        
        NetworkManager.shared.fetch(url: url) { [weak self] result in
            guard let self = self else { return }
            
            switch result{
            case .success(let data):
                completion(self.handleWithData(data: data))
            case .failure(let error):
                self.handleWithError(error: error)
            }
        }
    }
    
    private func handleWithError(error: Error){
        print(error.localizedDescription)
    }
    
    func getPageCount() -> Int? {
        return totalPages
    }
    
    private func handleWithData(data: Data) -> [Character]? {
        do {
            let characters = try JSONDecoder().decode(CharacterFeed.self, from: data)
            totalPages = characters.info?.pages
            return characters.results
        } catch {
            print(error)
            return nil
        }
    }
}
