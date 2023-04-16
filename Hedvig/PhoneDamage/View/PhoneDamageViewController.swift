//
//  PhoneDamageViewController.swift
//  Hedvig
//
//  Created by Sinan Ulusoy on 23.11.2022.
//

import UIKit
import SnapKit

protocol PhoneDamageVCProtocol: NSObject {
    func uptadeDamage(damageType: String)
}

final class PhoneDamageViewController: UIViewController {
    
    weak var delegate: PhoneDamageVCProtocol?
    
    private let damageTableView = UITableView()
    private let checkmarkImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupView()
        setupHierarchy()
        setupLayer()
    }
    
    private func setup() {
    }

    private func setupView() {
        view.backgroundColor = PhoneDamageConstant.Page.backgroundColor
        title = PhoneDamageConstant.NavigationBar.title
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(named: "backIcon"), style: .plain, target: self, action: #selector(didTapBarItem))
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: PhoneDamageConstant.NavigationBar.rightItemTitle, style: .plain, target: self, action: #selector(didTapBarItem))
        navigationController?.navigationBar.tintColor = .black
        
        damageTableView.delegate = self
        damageTableView.dataSource = self
        damageTableView.register(UITableViewCell.self, forCellReuseIdentifier: PhoneDamageConstant.Cell.id)
        damageTableView.layer.cornerRadius = 8
        damageTableView.isScrollEnabled = false
        
        checkmarkImageView.image = UIImage(named: "checkmarkIcon")
        checkmarkImageView.frame = .init(x: 0, y: 0, width: 20, height: 20)
    }

    private func setupHierarchy() {
        view.addSubview(damageTableView)
    }

    private func setupLayer() {
        damageTableView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(222)
        }
    }
}


extension PhoneDamageViewController {
    
    @objc private func didTapBarItem() {
        navigationController?.popViewController(animated: true)
    }
}

extension PhoneDamageViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PhoneDamageModel.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PhoneDamageConstant.Cell.id, for: indexPath)
        cell.textLabel?.text = PhoneDamageModel.allCases[indexPath.row].rawValue
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryView = checkmarkImageView
        delegate?.uptadeDamage(damageType: PhoneDamageModel.allCases[indexPath.row].rawValue)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryView = .none
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
}
