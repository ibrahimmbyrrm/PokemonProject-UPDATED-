//
//  PokemonListTableViewController.swift
//  PokemonWorld
//
//  Created by İbrahim Bayram on 28.05.2023.
//

import UIKit

class PokemonListTableViewController: UITableViewController{
    
    var index : Int?
    var pokemonListViewModel : PokemonListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        buildListVM()
    }
    
    private func buildListVM() {
        PokemonListViewModelBuilder.shared.pokemonListViewModelBuilder { vm in
            DispatchQueue.main.async {
                self.pokemonListViewModel = vm
                self.tableView.reloadData()
                
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        performSegue(withIdentifier: "toDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let pokemonVM = pokemonListViewModel?.itemAtIndex(index!)
        let builder = DetailVMBuilder(url: pokemonVM!.baseURL)
        if segue.identifier == "toDetail" {
            let destVC = segue.destination as! DetailViewController
            builder.build { vm in
                destVC.vm = vm
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonListViewModel?.numberOfRowsInSection(section) ?? 0
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PokemonListCell.identifier, for: indexPath) as! PokemonListCell
        let pokemonVM = pokemonListViewModel?.itemAtIndex(indexPath.row)
        let builder = DetailVMBuilder(url: pokemonVM!.baseURL)
        builder.build { vm in
            cell.setupCell(vm: vm)
        }
        return cell
    }

}
