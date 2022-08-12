//
//  RootRouter.swift
//  RIBsExample
//
//  Created by 장효원 on 2022/08/08.
//

import RIBs

protocol RootInteractable: Interactable, SplashListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: NavigateViewControllable {
    func present(viewControllable:ViewControllable)
    func dismiss(_ animated:Bool)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {
    
    private var splashRouting: SplashRouting?
    private var splashBuilder: SplashBuildable
    
    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: RootInteractable,
         viewController: RootViewControllable,
         splashBuilder: SplashBuildable
    ) {
        self.splashBuilder = splashBuilder
        
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
        
        print("RootRouter init")
    }
    
    override func didLoad() {
        super.didLoad()
        print("RootRouter didLoad")
    }
    
    func attachSplash() {
        let rib = splashBuilder.build(withListener: interactor)
        self.splashRouting = rib
        attachChild(rib)
        
        let navi = UINavigationController(root: rib.viewControllable)
        viewController.present(viewControllable: navi)
    }
}
