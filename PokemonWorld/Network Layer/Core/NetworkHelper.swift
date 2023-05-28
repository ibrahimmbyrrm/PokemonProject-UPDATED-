//
//  NetworkHelper.swift
//  PokemonWorld
//
//  Created by İbrahim Bayram on 28.05.2023.
//

import Foundation

enum NetworkError : Error{
    case badUrl
    case parsingError
    case invalidData
}

class Resource<T : Decodable> {
    let url : URL
    init(url: URL) {
        self.url = url
    }
}
