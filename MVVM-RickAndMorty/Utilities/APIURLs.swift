//
//  APIURLs.swift
//  MVVM-RickAndMorty
//
//  Created by Berk on 6.05.2023.
//

import Foundation

enum APIURLs {
    static func characters(page: Int) -> String {
        return "https://rickandmortyapi.com/api/character/?page=\(page)"
    }
    
    static func filterCharacters(name: String) -> String {
        return "https://rickandmortyapi.com/api/character/?name=\(name)"
    }
    
    static func imageUrl() -> String {
        return "https://rickandmortyapi.com/api/character/avatar/"
    }
}
