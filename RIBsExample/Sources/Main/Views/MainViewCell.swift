//
//  MainViewCell.swift
//  RIBsExample
//
//  Created by 장효원 on 2022/08/11.
//

import UIKit
import SnapKit
import Then

class MainViewCell: UITableViewCell {
    static let identifier = "MainViewCell"
    
    let titleLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        
        setupUI()
    }
    
    private func setupUI() {
        [
            titleLabel
        ].forEach {
            self.contentView.addSubview($0)
        }
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints{
            $0.leading.equalToSuperview().offset(5)
            $0.centerY.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
