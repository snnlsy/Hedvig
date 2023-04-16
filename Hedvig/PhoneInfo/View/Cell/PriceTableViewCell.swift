//
//  PriceTableViewCell.swift
//  Hedvig
//
//  Created by Sinan Ulusoy on 23.11.2022.
//

import UIKit
import SnapKit

final class PriceTableViewCell: UITableViewCell {
        
    private let insideView = UIView()
    private let cellTitleLabel = UILabel()
    private let priceTextField = UITextField()
    private let deleteIconButton = UIButton()
    private let explanationLabel = UILabel()

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
        explanationLabel.font = explanationLabel.font.withSize(13)
        
        priceTextField.delegate = self
        priceTextField.textAlignment = .right
        
        insideView.backgroundColor = PhoneInfoConstant.Cell.backgroundColor
        insideView.layer.cornerRadius = 8
        
        deleteIconButton.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        deleteIconButton.tintColor = PhoneInfoConstant.Cell.deleteIconColor
        deleteIconButton.addTarget(self, action: #selector(didTapDeleteIcon), for: .touchDown)
    }

    private func setupHierarchy() {
        contentView.addSubview(insideView)
        contentView.addSubview(explanationLabel)
        insideView.addSubview(cellTitleLabel)
        insideView.addSubview(priceTextField)
        insideView.addSubview(deleteIconButton)
    }

    private func setupLayer() {
        insideView.snp.makeConstraints { make in
            make.height.equalTo(64)
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
        
        explanationLabel.snp.makeConstraints { make in
            make.top.equalTo(insideView.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(13)
        }
        
        cellTitleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(16)
            make.width.equalToSuperview().multipliedBy(0.4)
        }
        
        deleteIconButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-16)
            make.width.height.equalTo(21)
        }
        
        priceTextField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(deleteIconButton.snp.leading).offset(-10)
            make.width.equalToSuperview().multipliedBy(0.4)
        }
    }
}


extension PriceTableViewCell: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension PriceTableViewCell {
    
    @objc private func didTapDeleteIcon() {
        priceTextField.text = ""
    }
    
    func configure(model: PriceTableViewCellModel) {
        self.cellTitleLabel.text = model.cellTitleLabel
        self.explanationLabel.text = model.explanationLabel
    }
}
