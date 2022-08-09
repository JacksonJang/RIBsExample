//
//  MemoViewController.swift
//  RIBsExample
//
//  Created by 장효원 on 2022/08/09.
//

import RIBs
import RxSwift
import UIKit

protocol MemoPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class MemoViewController: UIViewController, MemoPresentable, MemoViewControllable {

    weak var listener: MemoPresentableListener?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .red
    }
}
