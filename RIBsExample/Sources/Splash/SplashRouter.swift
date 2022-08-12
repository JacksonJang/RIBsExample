//
//  SplashRouter.swift
//  RIBsExample
//
//  Created by 장효원 on 2022/08/12.
//

import RIBs
import Lottie

protocol SplashInteractable: Interactable, MainListener {
    var router: SplashRouting? { get set }
    var listener: SplashListener? { get set }
}

protocol SplashViewControllable: NavigateViewControllable {
    var animationView:AnimationView? { get set }
}

final class SplashRouter: ViewableRouter<SplashInteractable, SplashViewControllable>, SplashRouting {
    
    private var mainRouting: MainRouting?
    private var mainBuilder: MainBuildable

    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: SplashInteractable,
         viewController: SplashViewControllable,
         mainBuilder: MainBuildable) {
        self.mainBuilder = mainBuilder
        
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    func moveToMain() {
        let rib = mainBuilder.build(withListener: interactor)
        attachChild(rib)
        self.mainRouting = rib
        
        viewController.set(viewController: rib.viewControllable)
    }
}
