//
//  PokemonList.swift
//  PokemonWorld
//
//  Created by İbrahim Bayram on 28.05.2023.
//

import Foundation

struct ListResponse : Decodable {
    let results : [BasePokemon]
}

struct BasePokemon : Decodable {
    let name : String
    let url : String
}
