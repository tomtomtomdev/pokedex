//
//  Network.swift
//  Pokedex
//
//  Created by tomtomtom on 8/14/24.
//

import Foundation
import Combine

class PokedexService {
    private var cancellables = Set<AnyCancellable>()
    
    func fetchPokemon() -> AnyPublisher<PokedexResponse, Error> {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon")!
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: PokedexResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
