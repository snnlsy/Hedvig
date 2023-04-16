//
//  ButtonTableViewCell.swift
//  Hedvig
//
//  Created by Sinan Ulusoy on 23.11.2022.
//

import UIKit
import SnapKit

final class ButtonTableViewCell: UITableViewCell {
        
    private let insideView = UIView()
    private let cellTitleLabel = UILabel()
    private let rightIconImageView = UIImageView()
    var cellButtonHandler: (() -> ())?

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
        rightIconImageView.image = UIImage(named: "rightIcon")

        let insideViewGesture = UITapGestureRecognizer(target: self, action: #selector(didTapInsideView(sender:)))
        insideView.addGestureRecognizer(insideViewGesture)
        insideView.isUserInteractionEnabled = true
        insideView.backgroundColor = PhoneInfoConstant.Cell.backgroundColor
        insideView.layer.cornerRadius = 8
    }

    private func setupHierarchy() {
        contentView.addSubview(insideView)
        insideView.addSubview(cellTitleLabel)
        insideView.addSubview(rightIconImageView)
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
        
        rightIconImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-16)
        }
    }
}


extension ButtonTableViewCell {
    
    @objc private func didTapInsideView(sender: UITapGestureRecognizer) {
        cellButtonHandler?()
    }
    
    func configure(model: ButtonTableViewCellModel) {
        self.cellTitleLabel.text = model.cellTitleLabel
        self.cellButtonHandler = model.buttonHandler
    }
}
