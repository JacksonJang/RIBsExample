//
//  AddViewController.swift
//  RIBsExample
//
//  Created by 장효원 on 2022/08/11.
//

import RIBs
import RxSwift
import UIKit

protocol AddPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class AddViewController: UIViewController, AddPresentable, AddViewControllable {

    weak var listener: AddPresentableListener?
}
