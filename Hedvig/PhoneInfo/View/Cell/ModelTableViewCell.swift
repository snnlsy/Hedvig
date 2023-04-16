//
//  ModelTableViewCell.swift
//  Hedvig
//
//  Created by Sinan Ulusoy on 23.11.2022.
//

import UIKit
import SnapKit

final class ModelTableViewCell: UITableViewCell {
        
    private let insideView = UIView()
    private let cellTitleLabel = UILabel()
    private let modelTextField = UITextField()

    override func layoutSubviews() {
        super.layoutSubviews()

        setup()
        setupView()
        setupHierarchy()
        setupLayer()
    }
    
    private func setup() {
    }

    private func setupView() {
        contentView.backgroundColor = PhoneInfoConstant.TableView.backgroundColor
        modelTextField.textAlignment = .right
        modelTextField.delegate = self
        
        insideView.backgroundColor = PhoneInfoConstant.Cell.backgroundColor
        insideView.layer.cornerRadius = 8
    }

    private func setupHierarchy() {
        contentView.addSubview(insideView)
        insideView.addSubview(cellTitleLabel)
        insideView.addSubview(modelTextField)
    }

    private func setupLayer() {
        insideView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        cellTitleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.width.equalToSuperview().multipliedBy(0.4)
        }
        
        modelTextField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-16)
            make.width.equalToSuperview().multipliedBy(0.5)
        }
    }
}


extension ModelTableViewCell: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension ModelTableViewCell {
    
    func configure(model: ModelTableViewCellModel) {
        self.cellTitleLabel.text = model.cellTitleLabel
    }
}
