//
//  PokemonsList.swift
//  PokemonList (iOS)
//
//  Created by Rafaela Nunes on 14/10/21.
//
import Foundation

struct PokemonsList: Decodable {
    let count: Int
    var results: [Results]
}

// MARK: - Result
struct Results: Decodable {
    let name: String
    let url: String
}
