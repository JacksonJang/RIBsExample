//
//  MainViewController.swift
//  RIBsExample
//
//  Created by 장효원 on 2022/08/09.
//

import RIBs
import RxSwift
import RxCocoa
import SnapKit
import Then
import UIKit


protocol MainPresentableListener: AnyObject {
    var items: BehaviorRelay<[TodoItem]> { get }
    
    func viewWillAppear()
    func moveToAddView()
}

final class MainViewController: BaseViewController, MainPresentable, MainViewControllable {
    weak var listener: MainPresentableListener?
    
    lazy var topView = TopView().then{
        $0.attachRightButton(title: "Add"){ [weak self] in
            self?.listener?.moveToAddView()
        }
    }
    
    lazy var tableView = UITableView().then{
        $0.delegate = self
        $0.dataSource = self
        $0.register(MainViewCell.self, forCellReuseIdentifier: MainViewCell.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.listener?.viewWillAppear()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Third Start")
        
        setupUI()
        setBindings()
    }
    
    private func setupUI() {
        [
            topView,
            tableView
        ].forEach{
            self.view.addSubview($0)
        }
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        topView.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        tableView.snp.makeConstraints{
            $0.top.equalTo(topView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
    }
    
    private func setBindings() {
        listener?.items
            .observeOn(MainScheduler.instance)
            .bind{[weak self] _ in
            self?.tableView.reloadData()
        }.disposed(by: disposeBag)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listener?.items.value.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainViewCell.identifier, for: indexPath) as! MainViewCell
        let index = indexPath.row
        let item = self.listener?.items.value[index]
        
        cell.titleLabel.text = item?.title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        
        print("index : \(index)")
    }
}
