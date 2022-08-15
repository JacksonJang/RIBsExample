//
//  MainInteractor.swift
//  RIBsExample
//
//  Created by 장효원 on 2022/08/09.
//

import RIBs
import RxSwift
import RxCocoa

protocol MainRouting: ViewableRouting {
    func attachAddView()
    func detachAddView()
}

protocol MainPresentable: Presentable {
    var listener: MainPresentableListener? { get set }
}

protocol MainListener: AnyObject {
    
}

final class MainInteractor: PresentableInteractor<MainPresentable>, MainInteractable, MainPresentableListener {
    var items: BehaviorRelay<[String]> = BehaviorRelay<[String]>(value: ["test1",
                                                                        "test2",
                                                                        "test3"])
    
    weak var router: MainRouting?
    weak var listener: MainListener?

    override init(presenter: MainPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        
        print("First Start")
    }

    override func willResignActive() {
        super.willResignActive()
        
    }
    
    func viewWillAppear() {
        print("MainInteractor viewWillAppear")
    }
    
    func save() {
        self.router?.detachAddView()
    }
    
    func moveToAddView() {
        self.router?.attachAddView()
    }
}
