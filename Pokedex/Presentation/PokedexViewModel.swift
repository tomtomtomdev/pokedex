//
//  PokedexViewModel.swift
//  Pokedex
//
//  Created by tomtomtom on 8/14/24.
//

import SwiftUI
import Combine

@MainActor
class PokedexViewModel: ObservableObject {
    @Published var pokemons: [Pokemon] = []
    
    private let service = PokedexService()
    
    func loadPokemon() async {
        do {
            let publisher = service.fetchPokemon()
            for try await response in publisher.values {
                self.pokemons = response.results
            }
        } catch {
            print("Failed to load Pokémon: \(error)")
        }
    }
}
