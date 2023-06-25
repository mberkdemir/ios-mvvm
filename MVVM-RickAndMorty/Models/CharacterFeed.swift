//
//  CharacterFeed.swift
//  MVVM-RickAndMorty
//
//  Created by Berk on 6.05.2023.
//

import Foundation

// MARK: - CharacterFeed
struct CharacterFeed: Codable {
    let info: Info?
    let results: [Character]?
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int?
    let next: String?
    let prev: String?
}

