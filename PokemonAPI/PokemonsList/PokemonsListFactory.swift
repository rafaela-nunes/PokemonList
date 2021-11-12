import UIKit

enum PokemonListFactory {
    static func make() -> UIViewController {
        let service: PokemonListServicing = PokemonListService()
        let router: PokemonListRouting = PokemonListRouter()
        let presenter: PokemonListPresenting = PokemonListPresenter(router: router)
        let interactor = PokemonListInteractor(service: service, presenter: presenter)
        let viewController = PokemonListViewController(interactor: interactor)

        router.viewController = viewController
        presenter.viewController = viewController

        return viewController
    }
}
