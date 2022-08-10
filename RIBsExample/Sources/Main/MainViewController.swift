//
//  MainViewController.swift
//  RIBsExample
//
//  Created by 장효원 on 2022/08/09.
//

import RIBs
import RxSwift
import RxCocoa
import UIKit

protocol MainPresentableListener: AnyObject {
    func viewWillAppear()
    var items: BehaviorRelay<[String]> { get }
}

final class MainViewController: BaseViewController, MainPresentable, MainViewControllable {
    weak var listener: MainPresentableListener?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.listener?.viewWillAppear()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listener?.items.bind{ items in
            for item in items {
                print(item)
            }
        }.disposed(by: disposeBag)
    }
}
