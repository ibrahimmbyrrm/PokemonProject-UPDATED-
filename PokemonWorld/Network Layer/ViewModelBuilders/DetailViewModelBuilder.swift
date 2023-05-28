//
//  DetailViewModelBuilder.swift
//  PokemonWorld
//
//  Created by İbrahim Bayram on 29.05.2023.
//

import Foundation

class DetailVMBuilder : ViewModelBuilderContract {

    var url : URL
    var webService: ServiceContract = Webservice()
    
    init(url: URL) {
        self.url = url
    }
}

extension DetailVMBuilder {
    
    func build(completion : @escaping (PokemonDetailViewModel)->Void) {
        webService.callApi(resource: Resource<PokemonModel>(url: url)) { result in
            switch result {
            case .success(let pokemonModel):
                let vm = PokemonDetailViewModel(pokemonModel: pokemonModel)
                completion(vm)
            case.failure(let error):
                print(error)
            }
        }
    }
}
