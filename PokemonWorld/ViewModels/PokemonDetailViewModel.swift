//
//  PokemonDetailViewModel.swift
//  PokemonWorld
//
//  Created by İbrahim Bayram on 28.05.2023.
//

import Foundation
import SDWebImage




class PokemonDetailViewModel {
    var pokemonModel : PokemonModel
    
    init(pokemonModel: PokemonModel) {
        self.pokemonModel = pokemonModel
    }
}

extension PokemonDetailViewModel {
    var name : String {
        return pokemonModel.name
    }
    var image : URL {
        return URL(string: (pokemonModel.sprites?.other.home.front_default)!)!
    }
    var abilities : [Ability] {
        return pokemonModel.abilities
    }
}
