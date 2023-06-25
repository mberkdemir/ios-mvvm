//
//  Character.swift
//  MVVM-RickAndMorty
//
//  Created by Berk on 6.05.2023.
//

import Foundation

// MARK: - Character
struct Character: Codable {
    let id: Int?
    let name, status, species, type: String?
    let gender: String?
    let origin, location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
    
    var _imageUrl: String {
        image ?? ""
    }
    
    var _name: String {
        name ?? ""
    }
    
    var _status: String {
        status ?? ""
    }
    
    var _species: String {
        species ?? ""
    }
    
    var _type: String {
        type ?? ""
    }
    
    var _gender: String {
        gender ?? ""
    }
}

// MARK: - Location
struct Location: Codable {
    let name: String?
    let url: String?
}
