//
//  PokemonListView.swift
//  PokemonList (iOS)
//
//  Created by Rafaela Nunes on 30/09/21.
//

import Foundation
import UIKit

class PokemonListView: UIView {
    //MARK: - Component

    private unowned var tableView: UITableView
    
    init(tableView: UITableView) {
        self.tableView = tableView
        super.init(frame: .zero)
        self.setupView()
        self.setupConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(tableView)
    }
    
    private func setupConstrains() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    
}
