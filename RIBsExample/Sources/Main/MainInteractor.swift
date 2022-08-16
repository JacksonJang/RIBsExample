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
    var items: BehaviorRelay<[TodoItem]> = BehaviorRelay<[TodoItem]>(value: [])
    
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
        getList()
    }
    
    func getList() {
        let data = LocalManager.shared.getTodoList()
        if let todoList = try? JSONDecoder().decode([TodoItem].self, from: data) {
            self.items = BehaviorRelay<[TodoItem]>.init(value: todoList)
        } else {
            items = BehaviorRelay<[TodoItem]>(value: [])
        }
    }
    
    func save(_ item: TodoItem) {
        items.accept(items.value + [item])
        
        if let data = try? JSONEncoder().encode(items.value) {
            LocalManager.shared.save(value: data, key: .todoList)
        }
        
        self.router?.detachAddView()
    }
    
    func moveToAddView() {
        self.router?.attachAddView()
    }
}
