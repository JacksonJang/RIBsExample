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
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class RootViewController: UIViewController, RootPresentable, RootViewControllable {

    weak var listener: RootPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        print("RootViewController viewDidLoad()")
    }
    
    func present(viewControllable: ViewControllable) {
        let vc = viewControllable.uiviewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    func dismiss(_ animated:Bool) {
        self.dismiss(animated: true)
    }
}
