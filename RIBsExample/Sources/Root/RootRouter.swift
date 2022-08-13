//
//  RootRouter.swift
//  RIBsExample
//
//  Created by 장효원 on 2022/08/08.
//

import RIBs

protocol RootInteractable: Interactable,
                           SplashListener,
                           MainListener
{
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
    private var mainRouting: MainRouting?
    private var mainBuilder: MainBuildable
    
    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: RootInteractable,
         viewController: RootViewControllable,
         splashBuilder: SplashBuildable,
         mainBuilder: MainBuildable
    ) {
        
        self.splashBuilder = splashBuilder
        self.mainBuilder = mainBuilder
        
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
    
    func detachSplash() {
        if let splashRouting = splashRouting {
            detachChild(splashRouting)
            viewController.dismiss(false)
            self.splashRouting = nil
        }
    }
    
    func attachMain() {
        let rib = mainBuilder.build(withListener: interactor)
        self.mainRouting = rib
        attachChild(rib)
        
        let navi = UINavigationController(root: rib.viewControllable)
        viewController.present(viewControllable: navi)
    }
    
    func detachMain() {
        if let mainRouting = mainRouting {
            detachChild(mainRouting)
            viewController.dismiss(false)
            self.mainRouting = nil
        }
    }
    
}
