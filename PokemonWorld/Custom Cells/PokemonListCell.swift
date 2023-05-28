//
//  PokemonListCell.swift
//  PokemonWorld
//
//  Created by İbrahim Bayram on 28.05.2023.
//

import UIKit
import SDWebImage

class PokemonListCell: UITableViewCell {
    
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    static let identifier = "PokemonListCell"
    
    func setupCell(vm : PokemonDetailViewModel) {
        DispatchQueue.main.async {
            self.nameLabel.text = vm.name
            self.pokemonImage.sd_setImage(with: vm.image)
        }
       
    }
  
}
