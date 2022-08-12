//
//  UINavigationExt.swift
//  RIBsExample
//
//  Created by 장효원 on 2022/08/09.
//

import RIBs

extension UINavigationController: ViewControllable {
    public var uiviewController: UIViewController {
        return self
    }
  
    convenience init(root: ViewControllable) {
        self.init(rootViewController: root.uiviewController)
    }
}

protocol NavigateViewControllable: ViewControllable {
    func push(viewController: ViewControllable, animated: Bool)
    func pop(_ animated: Bool)
}

extension NavigateViewControllable {
    func set(viewController: ViewControllable, animated: Bool = true) {
        uiviewController.navigationController?.setViewControllers([viewController.uiviewController], animated: animated)
    }
    
    func push(viewController: ViewControllable, animated: Bool = true) {
        uiviewController.navigationController?.pushViewController(viewController.uiviewController, animated: animated)
    }
    
    func pop(_ animated: Bool) {
        uiviewController.navigationController?.popViewController(animated: animated)
    }
}
