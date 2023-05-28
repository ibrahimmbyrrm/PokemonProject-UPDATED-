//
//  File.swift
//  PokemonWorld
//
//  Created by İbrahim Bayram on 28.05.2023.
//

import Foundation

protocol ViewModelBuilderContract {
    var webService : ServiceContract {get}
}


class PokemonListViewModelBuilder : ViewModelBuilderContract{

    static let shared = PokemonListViewModelBuilder()
    
    var webService: ServiceContract = Webservice()
    lazy var listAPI = URL(string: ProcessInfo.processInfo.environment["listURL"]!)

    
    
}

extension PokemonListViewModelBuilder {
    func pokemonListViewModelBuilder(completion : @escaping (PokemonListViewModel)->Void) {
        guard let listAPI = listAPI else {return}
        webService.callApi(resource: Resource<ListResponse>(url: listAPI)) { result in
            switch result {
            case .success(let listResponse):
                let viewModel = PokemonListViewModel()
                viewModel.pokemonList = listResponse.results
                completion(viewModel)
            case.failure(let error):
                print(error)
            }
        }
    }
}




