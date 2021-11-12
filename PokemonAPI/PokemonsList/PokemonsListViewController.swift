//
//  PokemonListViewController.swift
//  PokemonList (iOS)
//
//  Created by Rafaela Nunes on 30/09/21.
//

import UIKit

protocol PokemonListDisplayng: AnyObject {
    func setPokemons(pokemons: PokemonsList)
    func listOrder(result: [Results])
}

class PokemonListViewController: UIViewController, PokemonListDisplayng {
    
    private var contentView: PokemonListView?
    private let interactor: PokemonListInteracting
    private var pokemons: PokemonsList?
    private var count: Int = .zero
    private var offSet: Int = .zero
    
    private lazy var tableView: UITableView = {
        var tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    init(interactor: PokemonListInteracting) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cicle

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(PokemonTableViewCell.self, forCellReuseIdentifier: "PokemonTableViewCell")
        let logoutBarButtonItem = UIBarButtonItem(title: "Ordenar", style: .done, target: self, action: #selector(orderList))
            self.navigationItem.rightBarButtonItem  = logoutBarButtonItem

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        title = "lista"
        interactor.getPokemons(offSet: offSet)
    }
    
    override func loadView() {
        super.loadView()
        contentView = PokemonListView(tableView: tableView)
        self.view = contentView
    }
    
    func setPokemons(pokemons: PokemonsList) {
        count = pokemons.count
//        self.pokemons?.results.append(contentsOf: pokemons.results)
        self.pokemons = pokemons
        tableView.reloadData()
    }
    
    func listOrder(result: [Results]) {
        self.pokemons?.results = result
        tableView.reloadData()
    }
    
    @objc private func orderList() {
        guard let pokemonsList = pokemons else { return }
        interactor.listOrder(pokemons: pokemonsList)
    }
}

extension PokemonListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pokemons?.results.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonTableViewCell", for: indexPath) as? PokemonTableViewCell {
            guard let poke = pokemons else { return cell}
            cell.setupCell(pokemon: poke.results[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        interactor.didTapDetails(index: indexPath.row + 1)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(50)
    }
}
