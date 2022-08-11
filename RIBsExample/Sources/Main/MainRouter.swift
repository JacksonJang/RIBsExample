//
//  MainRouter.swift
//  RIBsExample
//
//  Created by 장효원 on 2022/08/09.
//

import RIBs

protocol MainInteractable: Interactable, AddListener {
    var router: MainRouting? { get set }
    var listener: MainListener? { get set }
}

//MARK:  Used NavigationExt.swift
protocol MainViewControllable: NavigateViewControllable {
    
}

final class MainRouter: ViewableRouter<MainInteractable, MainViewControllable>, MainRouting {
    private var addRouting: AddRouting?
    private var addBuilder:AddBuildable
    
    init(interactor: MainInteractable,
         viewController: MainViewControllable,
         addBuilder: AddBuildable) {
        
        self.addBuilder = addBuilder
        
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
        
        print("Second Start")
    }
    
    func attachAddView() {
        let rib = addBuilder.build(withListener: interactor)
        self.addRouting = rib
        attachChild(rib)
        
        let vc = rib.viewControllable.uiviewController
        viewController.push(viewController: vc, animated: true)
    }
}
