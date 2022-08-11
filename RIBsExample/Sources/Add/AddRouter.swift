//
//  AddRouter.swift
//  RIBsExample
//
//  Created by 장효원 on 2022/08/11.
//

import RIBs

protocol AddInteractable: Interactable {
    var router: AddRouting? { get set }
    var listener: AddListener? { get set }
}

protocol AddViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class AddRouter: ViewableRouter<AddInteractable, AddViewControllable>, AddRouting {

    // TODO: Constructor inject child builder protocols to allow building children.
    override init(interactor: AddInteractable, viewController: AddViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
