//
//  BaseViewController.swift
//  RIBsExample
//
//  Created by 장효원 on 2022/08/10.
//

import Foundation
import UIKit
import RxSwift

class BaseViewController: UIViewController {
    public var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
    }
}
