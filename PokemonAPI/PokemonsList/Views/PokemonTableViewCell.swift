//
//  PokemonTableViewCell.swift
//  PokemonList (iOS)
//
//  Created by Rafaela Nunes on 12/10/21.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
    //MARK: Compenents
    
    private let pokemonName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()

    func setupCell(pokemon: Results) {
        addSubviews()
        nameConstrains()
        setupComponents(pokemon: pokemon)
    }
    
    private func addSubviews() {
        addSubview(pokemonName)
    }
    
    private func setupComponents(pokemon: Results) {
        pokemonName.text = pokemon.name
    }
    
    private func nameConstrains() {
        NSLayoutConstraint.activate([
            pokemonName.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            pokemonName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            pokemonName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16),
        ])
    }
}
