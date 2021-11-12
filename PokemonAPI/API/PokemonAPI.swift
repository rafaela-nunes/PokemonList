//
//  PokemonAPI.swift
//  PokemonList (iOS)
//
//  Created by Rafaela Nunes on 12/10/21.
//

import Foundation

enum PokemonError: Error {
    case invalidUrl
    case apiError(error: String)
    case dataError
    case parseError(description: String)
}

protocol PokeAPIProtocol: AnyObject {
    func requestAPI<T: Decodable>(completion: @escaping (Result<T, PokemonError>) -> Void)
}

class PokemonAPI {
    private let session: URLSession
    private let decoder: JSONDecoder
    private let url: String
    
    init(session: URLSession = URLSession.shared, decoder: JSONDecoder = JSONDecoder(), url: String) {
        self.session = session
        self.decoder = decoder
        self.url = url
    }
}

extension PokemonAPI: PokeAPIProtocol {
    func requestAPI<T>(completion: @escaping (Result<T, PokemonError>) -> Void) where T : Decodable {
        guard let api = URL(string: url) else {
            completion(.failure(.invalidUrl))
            return
        }
        
        let task = session.dataTask(with: api) { (data, response, error) in
            if let erro = error {
                completion(.failure(.apiError(error: erro.localizedDescription)))
                return
            }

            guard let jsonData = data else {
                completion(.failure(.dataError))
                return
            }
            
            do {
                let decoded = try self.decoder.decode(T.self, from: jsonData)
                completion(.success(decoded))
            } catch let error {
                completion(.failure(.parseError(description: error.localizedDescription)))
            }
        }
        
        task.resume()
    }
}
