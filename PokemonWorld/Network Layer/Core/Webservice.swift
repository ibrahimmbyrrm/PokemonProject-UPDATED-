//
//  Webservice.swift
//  PokemonWorld
//
//  Created by İbrahim Bayram on 28.05.2023.
//

import Foundation

protocol ServiceContract {
    func callApi<T>(resource : Resource<T>, completion : @escaping (Result<T, NetworkError>)->Void)
}

class Webservice: ServiceContract {
    
    func callApi<T>(resource : Resource<T>, completion : @escaping (Result<T, NetworkError>)->Void) {
        URLSession.shared.dataTask(with: resource.url) { data, _, error in
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            let results = try? JSONDecoder().decode(T.self, from: data)
            guard let results = results else {
                completion(.failure(.parsingError))
                return
            }
            completion(.success(results))
        }.resume()
    }
    
}
