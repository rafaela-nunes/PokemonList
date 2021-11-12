import Foundation

protocol PokemonListInteracting: AnyObject {
    func getPokemons(offSet: Int)
    func didTapDetails(index: Int)
    func listOrder(pokemons: PokemonsList)
}

final class PokemonListInteractor: PokemonListInteracting {

    private let service: PokemonListServicing
    private let presenter: PokemonListPresenting
    private var currentIndex: Int = 0
    
    private enum Constants {
        static let limit: Int = 10
    }

    init(service: PokemonListServicing, presenter: PokemonListPresenting) {
        self.service = service
        self.presenter = presenter
    }
    
    func getPokemons(offSet: Int) {
        if offSet >= currentIndex {
            self.currentIndex += 1
        }
        service.getPokemonList(offSet: currentIndex, limit: Constants.limit) { result in
            switch result {
            case .success(let response):
                self.presenter.setPokemons(pokemons: response)
            case .failure(let error):
                break
            }
        }
    }
    
    func didTapDetails(index: Int) {
        presenter.didTapDetails(index: index)
    }
    
    func listOrder(pokemons: PokemonsList) {
        presenter.listOrder(pokemons: pokemons)
    }
}
