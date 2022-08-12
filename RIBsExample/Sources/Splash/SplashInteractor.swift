//
//  SplashInteractor.swift
//  RIBsExample
//
//  Created by 장효원 on 2022/08/12.
//

import RIBs
import RxSwift

protocol SplashRouting: ViewableRouting {
    func moveToMain()
}

protocol SplashPresentable: Presentable {
    var listener: SplashPresentableListener? { get set }
    // TODO: Declare methods the interactor can invoke the presenter to present data.
}

protocol SplashListener: AnyObject {
    
}

final class SplashInteractor: PresentableInteractor<SplashPresentable>, SplashInteractable, SplashPresentableListener {
    
    weak var router: SplashRouting?
    weak var listener: SplashListener?

    override init(presenter: SplashPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        
    }

    override func willResignActive() {
        super.willResignActive()
        
    }
    
    func moveToMain() {
        self.router?.moveToMain()
    }
}
