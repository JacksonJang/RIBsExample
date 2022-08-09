//
//  MainViewController.swift
//  RIBsExample
//
//  Created by 장효원 on 2022/08/09.
//

import RIBs
import RxSwift
import UIKit

protocol MainPresentableListener: AnyObject {
    func viewWillAppear()
}

final class MainViewController: UIViewController, MainPresentable, MainViewControllable {
    weak var listener: MainPresentableListener?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.listener?.viewWillAppear()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .blue
    }
}
