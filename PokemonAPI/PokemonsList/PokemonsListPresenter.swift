//
//  PokemonListPresenter.swift
//  Pokemon
//
//  Created by Rafaela Nunes on 04/11/21.
//

import UIKit

protocol PokemonListPresenting: AnyObject {
    var viewController: PokemonListViewController? { get set }
    func setPokemons(pokemons: PokemonsList)
    func didTapDetails(index: Int)
    func listOrder(pokemons: PokemonsList)
}

class PokemonListPresenter: PokemonListPresenting {
    
    weak var viewController: PokemonListViewController?
    private let router: PokemonListRouting
    
    init(router: PokemonListRouting) {
        self.router = router
    }

    func setPokemons(pokemons: PokemonsList) {
        viewController?.setPokemons(pokemons: pokemons)
    }
    
    func didTapDetails(index: Int) {
        router.showDetails(index: index)
    }
    
    func listOrder(pokemons: PokemonsList) {
        let listOrder = pokemons.results.sorted(by: {$0.name < $1.name})
        viewController?.listOrder(result: listOrder)
    }
}
