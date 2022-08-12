//
//  RootViewController.swift
//  RIBsExample
//
//  Created by 장효원 on 2022/08/08.
//

import RIBs
import RxSwift
import UIKit

protocol RootPresentableListener: AnyObject {
    func attachSplash()
}

final class RootViewController: BaseViewController, RootPresentable, RootViewControllable {

    weak var listener: RootPresentableListener?
    
    func present(viewControllable: ViewControllable) {
        let vc = viewControllable.uiviewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    func dismiss(_ animated:Bool) {
        self.dismiss(animated: true)
    }
}
