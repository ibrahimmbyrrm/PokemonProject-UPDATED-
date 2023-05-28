//
//  PokemonDetail.swift
//  PokemonWorld
//
//  Created by İbrahim Bayram on 28.05.2023.
//

import Foundation

struct PokemonModel : Decodable {
    let abilities : [Ability]
    let name : String
    let sprites : Sprite?
}

//Ability Structs

struct Ability : Decodable {
    let ability : AbilityDetails
}
struct AbilityDetails : Decodable {
    let name : String
    let url : String
}

//Photo Structs

struct Sprite : Decodable {
    let front_default : String
    let other : OtherPhotos
}

struct OtherPhotos : Decodable {
    let home : DreamWorld
}
struct DreamWorld : Decodable {
    let front_default : String
}
