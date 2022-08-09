//
//  RootRouter.swift
//  RIBsExample
//
//  Created by 장효원 on 2022/08/08.
//

import RIBs

protocol RootInteractable: Interactable, MainListener, MemoListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

protocol RootViewControllable: ViewControllable {
    func present(viewControllable:ViewControllable)
    func dismiss(_ animated:Bool)
}

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {
    private var mainRouting: MainRouting?
    private var mainBuilder: MainBuildable
    private var memoRouting: MemoRouting?
    private var memoBuilder: MemoBuildable
    
    // TODO: Constructor inject child builder protocols to allow building children.
    init(interactor: RootInteractable,
         viewController: RootViewControllable,
         mainBuilder: MainBuildable,
         memoBuilder: MemoBuildable) {
        
        self.mainBuilder = mainBuilder
        self.memoBuilder = memoBuilder
        
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
        
        print("RootRouter init")
    }
    
    override func didLoad() {
        super.didLoad()
        print("RootRouter didLoad")
    }
    
    func attachMain() {
        let rib = mainBuilder.build(withListener: interactor)
        self.mainRouting = rib
        attachChild(rib)
        
        let navi = UINavigationController(root: rib.viewControllable)
        viewController.present(viewControllable: navi)
    }
    
    func detachMain() {
        if let mainRouting = mainRouting {
            viewController.dismiss(true)
            detachChild(mainRouting)
            self.mainRouting = nil
        }
    }
    
    func attachMemo() {
        let rib = memoBuilder.build(withListener: interactor)
        self.memoRouting = rib
        attachChild(rib)
        
        viewController.present(viewControllable: rib.viewControllable)
    }
    
    func detachMemo() {
        if let memoRouting = memoRouting {
            viewController.dismiss(true)
            detachChild(memoRouting)
            self.memoRouting = nil
        }
    }
}
