//
//  SplashRouter.swift
//  RIBsExample
//
//  Created by 장효원 on 2022/08/12.
//

import RIBs
import Lottie

protocol SplashInteractable: Interactable {
    var router: SplashRouting? { get set }
    var listener: SplashListener? { get set }
}

protocol SplashViewControllable: NavigateViewControllable {
    var animationView:AnimationView? { get set }
}

final class SplashRouter: ViewableRouter<SplashInteractable, SplashViewControllable>, SplashRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: SplashInteractable,
         viewController: SplashViewControllable) {
        
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
