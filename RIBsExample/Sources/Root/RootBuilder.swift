//
//  RootBuilder.swift
//  RIBsExample
//
//  Created by 장효원 on 2022/08/08.
//

import RIBs

protocol RootDependency: Dependency {
    // TODO: Declare the set of dependencies required by this RIB, but cannot be
    // created by this RIB.
}

final class RootComponent: Component<RootDependency>,
                           MainDependency,
                           SplashDependency
{

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol RootBuildable: Buildable {
    func build() -> LaunchRouting
}

final class RootBuilder: Builder<RootDependency>, RootBuildable {

    override init(dependency: RootDependency) {
        super.init(dependency: dependency)
        print("RootBuilder init")
    }

    func build() -> LaunchRouting {
        let component = RootComponent(dependency: dependency)
        let viewController = RootViewController()
        let interactor = RootInteractor(presenter: viewController)
        
        let mainBuilder = MainBuilder(dependency: component)
        let splashBuilder = SplashBuilder(dependency: component)
        
        print("RootBuilder build()")
        
        return RootRouter(interactor: interactor,
                          viewController: viewController,
                          mainBuilder: mainBuilder,
                          splashBuilder: splashBuilder)
    }
}
