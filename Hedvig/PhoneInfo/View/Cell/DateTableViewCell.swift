//
//  DateTableViewCell.swift
//  Hedvig
//
//  Created by Sinan Ulusoy on 23.11.2022.
//

import UIKit
import SnapKit

final class DateTableViewCell: UITableViewCell {
        
    private let insideView = UIView()
    private let cellTitleLabel = UILabel()
    private let dateButton = UIButton()
    private let datePicker = UIDatePicker()

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
        
        insideView.backgroundColor = PhoneInfoConstant.Cell.backgroundColor
        insideView.layer.cornerRadius = 8
        
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .compact
        datePicker.maximumDate = Date()
    }

    private func setupHierarchy() {
        contentView.addSubview(insideView)
        insideView.addSubview(cellTitleLabel)
        insideView.addSubview(datePicker)
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
        
        datePicker.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-16)
        }
    }
}


extension DateTableViewCell {
    
    func configure(model: DateTableViewCellModel) {
        self.cellTitleLabel.text = model.cellTitleLabel
    }
}
