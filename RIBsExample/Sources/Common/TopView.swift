//
//  TopView.swift
//  RIBsExample
//
//  Created by 장효원 on 2022/08/14.
//

import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa

class TopView: UIView {
    let disposeBag = DisposeBag()
    
    let rightStackView = UIStackView().then{
        $0.alignment = .fill
        $0.distribution = .fill
        $0.axis = .horizontal
    }
    
    init() {
        super.init(frame: CGRect.zero)
        
        setupUI()
    }
    
    private func setupUI() {
        self.addSubview(rightStackView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        rightStackView.snp.makeConstraints{
            $0.top.trailing.bottom.equalToSuperview()
        }
    }
    
    /*
     Put AddView on the top right.
     */
    func attachRightButton(title:String, completion:(()->Void)? = nil) {
        lazy var button = UIButton().then{
            $0.setTitle(title, for: .normal)
            $0.setTitleColor(.black, for: .normal)
            
            $0.rx.tap.bind{
                completion?()
            }.disposed(by: disposeBag)
        }
        
        lazy var view = UIView().then{
            $0.addSubview(button)
            button.snp.makeConstraints{
                $0.top.leading.trailing.bottom.equalToSuperview()
            }
        }
        
        rightStackView.addArrangedSubview(view)
        
        view.snp.makeConstraints{
            $0.width.equalTo(50)
        }
        button.snp.makeConstraints{
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
