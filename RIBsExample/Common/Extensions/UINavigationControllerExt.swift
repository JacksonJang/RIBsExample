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
    func push(viewController: UIViewController, animated: Bool)
    func pop(_ animated: Bool)
}

extension NavigateViewControllable {
    func push(viewController: UIViewController, animated: Bool) {
        print("push")
    }
    
    func pop(_ animated: Bool) {
        print("pop")
    }
}
