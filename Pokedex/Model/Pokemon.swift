//
//  Pokemon.swift
//  Pokedex
//
//  Created by tomtomtom on 8/14/24.
//

import Foundation

struct Pokemon: Decodable {
    let name: String
    let url: String
}

struct PokedexResponse: Decodable {
    let results: [Pokemon]
}
