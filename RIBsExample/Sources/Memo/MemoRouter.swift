//
//  MemoRouter.swift
//  RIBsExample
//
//  Created by 장효원 on 2022/08/09.
//

import RIBs

protocol MemoInteractable: Interactable {
    var router: MemoRouting? { get set }
    var listener: MemoListener? { get set }
}

protocol MemoViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class MemoRouter: ViewableRouter<MemoInteractable, MemoViewControllable>, MemoRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: MemoInteractable, viewController: MemoViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
