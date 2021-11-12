import Foundation

protocol PokemonListServicing {
    func getPokemonList(offSet: Int, limit: Int, completion: @escaping (Result<PokemonsList, PokemonError>) -> Void)
}

final class PokemonListService: PokemonListServicing {

    func getPokemonList(offSet: Int, limit: Int, completion: @escaping (Result<PokemonsList, PokemonError>) -> Void) {
        let url = "https://pokeapi.co/api/v2/pokemon?offSet=\(offSet)&limit=\(limit)"
        PokemonAPI(url: url).requestAPI { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
