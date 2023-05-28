//
//  PokemonListViewModel.swift
//  PokemonWorld
//
//  Created by İbrahim Bayram on 28.05.2023.
//

import Foundation


class PokemonListViewModel {
    var pokemonList = [BasePokemon]()
}

extension PokemonListViewModel {
    
    func numberOfRowsInSection(_ section : Int) -> Int {
        return pokemonList.count
    }
    
    func itemAtIndex(_ index : Int) -> PokemonViewModel {
        return PokemonViewModel(basePokemon: pokemonList[index])
    }
    
}

class PokemonViewModel {
    let basePokemon : BasePokemon
    
    init(basePokemon: BasePokemon) {
        self.basePokemon = basePokemon
    }
}

extension PokemonViewModel {
    var name : String {
        return basePokemon.name
    }
    var baseURL : URL {
        return URL(string: basePokemon.url)!
    }
}
