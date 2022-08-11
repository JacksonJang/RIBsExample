//
//  AddInteractor.swift
//  RIBsExample
//
//  Created by 장효원 on 2022/08/11.
//

import RIBs
import RxSwift

protocol AddRouting: ViewableRouting {
    // TODO: Declare methods the interactor can invoke to manage sub-tree via the router.
}

protocol AddPresentable: Presentable {
    var listener: AddPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol AddListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class AddInteractor: PresentableInteractor<AddPresentable>, AddInteractable, AddPresentableListener {

    weak var router: AddRouting?
    weak var listener: AddListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: AddPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        // TODO: Implement business logic here.
    }

    override func willResignActive() {
        super.willResignActive()
        // TODO: Pause any business logic.
    }
}
