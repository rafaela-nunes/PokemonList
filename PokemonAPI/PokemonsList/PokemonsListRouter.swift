import UIKit

protocol PokemonListRouting: AnyObject {
    var viewController: UIViewController? { get set }
    func showDetails(index: Int)
}

final class PokemonListRouter: PokemonListRouting {

    weak var viewController: UIViewController?

    func showDetails(index: Int) {
//        let controller = PokemonDetailsFactory.make(index: index)
//        viewController?.present(controller, animated: true, completion: nil)
    }
}
