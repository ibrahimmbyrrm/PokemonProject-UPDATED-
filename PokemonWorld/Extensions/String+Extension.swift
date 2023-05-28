//
//  String+Extension.swift
//  PokemonWorld
//
//  Created by İbrahim Bayram on 28.05.2023.
//

import Foundation

extension String {
    func asURL() -> URL {
        return URL(string: self)!
    }
}
