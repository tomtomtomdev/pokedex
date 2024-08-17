//
//  PokedexView.swift
//  Pokedex
//
//  Created by tomtomtom on 8/14/24.
//

import SwiftUI

struct PokedexView: View {
    @StateObject private var viewModel = PokedexViewModel()
    
    var body: some View {
        List(viewModel.pokemons, id: \.name) { pokemon in
            Text(pokemon.name.capitalized)
        }
        .task {
            await viewModel.loadPokemon()
        }
    }
}
