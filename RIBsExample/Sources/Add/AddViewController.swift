//
//  AddViewController.swift
//  RIBsExample
//
//  Created by 장효원 on 2022/08/11.
//

import RIBs
import RxSwift
import RxCocoa
import UIKit
import Then
import SnapKit

protocol AddPresentableListener: AnyObject {
    func save(_ item:TodoItem)
}

final class AddViewController: BaseViewController, AddPresentable, AddViewControllable {
    weak var listener: AddPresentableListener?
    
    let textField = UITextField().then{
        $0.placeholder = "You can add Todo"
    }
    let saveButton = UIButton().then{
        $0.setTitle("Save", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupRx()
    }
    
    private func setupUI() {
        [
            textField,
            saveButton
        ].forEach{
            self.view.addSubview($0)
        }
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        textField.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalTo(saveButton.snp.leading).offset(-20)
            $0.height.equalTo(saveButton)
        }
        
        saveButton.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.width.equalTo(50)
        }
    }
    
    private func setupRx() {
        saveButton.rx.tap.bind{ [weak self] in
            if let text = self?.textField.text {
                let item = TodoItem(title: text)
                
                self?.listener?.save(item)
            }
        }.disposed(by: disposeBag)
    }
}
