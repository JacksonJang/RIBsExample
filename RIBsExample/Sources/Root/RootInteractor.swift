//
//  RootInteractor.swift
//  RIBsExample
//
//  Created by 장효원 on 2022/08/08.
//

import RIBs
import RxSwift

protocol RootRouting: ViewableRouting {
    func attachSplash()
    func detachSplash()
    func attachMain()
    func detachMain()
}

protocol RootPresentable: Presentable {
    var listener: RootPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol RootListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

final class RootInteractor: PresentableInteractor<RootPresentable>, RootInteractable, RootPresentableListener {
    
    weak var router: RootRouting?
    weak var listener: RootListener?

    // TODO: Add additional dependencies to constructor. Do not perform any logic
    // in constructor.
    override init(presenter: RootPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
        
        print("RootInteractor init")
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        
        print("RootInteractor didBecomeActive")
        self.router?.attachSplash()
    }

    override func willResignActive() {
        super.willResignActive()
        
        print("RootInteractor willResignActive")
    }
    
    func attachSplash() {
        self.router?.attachSplash()
    }
    
    func detachSplash() {
        self.router?.detachSplash()
    }
    
    func attachMain() {
        self.router?.attachMain()
    }
    
    func detachMain() {
        self.router?.detachMain()
    }
    
    //MARK: Used SplashInteractor
    func moveToMain() {
        self.router?.detachSplash()
        self.router?.attachMain()
    }
    
    
}
