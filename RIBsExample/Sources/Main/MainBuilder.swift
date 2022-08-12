//
//  MainBuilder.swift
//  RIBsExample
//
//  Created by 장효원 on 2022/08/09.
//

import RIBs

protocol MainDependency: Dependency { }

final class MainComponent: Component<MainDependency>, AddDependency { }

// MARK: - Builder

protocol MainBuildable: Buildable {
    func build(withListener listener: MainListener) -> MainRouting
}

final class MainBuilder: Builder<MainDependency>, MainBuildable {

    override init(dependency: MainDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: MainListener) -> MainRouting {
        let component = MainComponent(dependency: dependency)
        let viewController = MainViewController()
        let interactor = MainInteractor(presenter: viewController)
        interactor.listener = listener
        
        let addBuilder = AddBuilder(dependency: component)
        
        return MainRouter(interactor: interactor, viewController: viewController, addBuilder: addBuilder)
    }
}
