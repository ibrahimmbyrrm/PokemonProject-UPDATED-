//
//  DetailViewController.swift
//  PokemonWorld
//
//  Created by İbrahim Bayram on 28.05.2023.
//

import UIKit

class DetailViewController: UIViewController{

    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!

    weak var vm : PokemonDetailViewModel! {
        didSet {
            setup(vm: vm!)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func setup(vm : PokemonDetailViewModel) {
        DispatchQueue.main.async {
            self.pokemonNameLabel.text = vm.name
            self.pokemonImageView.sd_setImage(with: vm.image)
        }
        
    }
   


}
