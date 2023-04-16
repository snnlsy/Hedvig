//
//  PhoneInfoViewController.swift
//  Hedvig
//
//  Created by Sinan Ulusoy on 22.11.2022.
//

import UIKit
import SnapKit

final class PhoneInfoViewController: UIViewController {
    
    private let phoneInfoTableView = UITableView()
    private var phoneInfoModelList = [PhoneInfoModel]()
    private let phoneDamageVC = PhoneDamageViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        setupView()
        setupHierarchy()
        setupLayer()
    }

    private func setup() {
        configureModel()
        phoneDamageVC.delegate = self
    }

    private func setupView() {
        let barButtonRight = UIImage(named: "crossIcon")?.withRenderingMode(.alwaysOriginal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: barButtonRight, style: .plain, target: self, action: #selector(dismissVC))
        navigationController?.navigationBar.backgroundColor = PhoneInfoConstant.NavigationBar.backgroundColor
        title = PhoneInfoConstant.NavigationBar.title
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard(_:)))
        view.addGestureRecognizer(tapGesture)

        phoneInfoTableView.delegate = self
        phoneInfoTableView.dataSource = self
        phoneInfoTableView.register(ModelTableViewCell.self)
        phoneInfoTableView.register(PriceTableViewCell.self)
        phoneInfoTableView.register(ButtonTableViewCell.self)
        phoneInfoTableView.register(DateTableViewCell.self)
        phoneInfoTableView.backgroundColor = PhoneInfoConstant.TableView.backgroundColor
        phoneInfoTableView.contentInset = UIEdgeInsets(top: 36, left: 0, bottom: 0, right: 0)
        phoneInfoTableView.separatorStyle = .none
        phoneInfoTableView.allowsSelection = false
    }

    private func setupHierarchy() {
        view.addSubview(phoneInfoTableView)
    }

    private func setupLayer() {
        phoneInfoTableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}


extension PhoneInfoViewController {
    
    @objc private func dismissVC() {
        dismiss(animated: true)
    }
    
    @objc private func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
}

extension PhoneInfoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return phoneInfoModelList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = phoneInfoModelList[indexPath.row].cellType.self
        
        switch model {
        case .modelCell(model: let model):
            let cell: ModelTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(model: model)
            return cell
        case .priceCell(model: let model):
            let cell: PriceTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(model: model)
            return cell
        case .buttonCell(model: let model):
            let cell: ButtonTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(model: model)
            return cell
        case .dateCell(model: let model):
            let cell: DateTableViewCell = tableView.dequeueReusableCell(for: indexPath)
            cell.configure(model: model)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let model = phoneInfoModelList[indexPath.row].cellType.self
        switch model {
        case .priceCell(model: _):
            return 110
        default:
            return 84
        }
    }
}

extension PhoneInfoViewController: PhoneDamageVCProtocol {
    
    func uptadeDamage(damageType: String) {
        phoneInfoModelList[3].cellType.adjust(damageType: damageType)
        phoneInfoTableView.reloadDataAsync()
    }
}

extension PhoneInfoViewController {
    
    private func configureModel() {
        phoneInfoModelList.append(
            PhoneInfoModel(cellType: .modelCell(
                model: ModelTableViewCellModel(
                    cellTitleLabel: PhoneInfoConstant.Cell.Title.model.rawValue
            )))
        )
        phoneInfoModelList.append(
            PhoneInfoModel(cellType: .dateCell(model: DateTableViewCellModel(
                cellTitleLabel: PhoneInfoConstant.Cell.Title.date.rawValue
            )))
        )
        phoneInfoModelList.append(
            PhoneInfoModel(cellType: .priceCell(model: PriceTableViewCellModel(
                cellTitleLabel: PhoneInfoConstant.Cell.Title.price.rawValue,
                explanationLabel: PhoneInfoConstant.Cell.Expalanation.price.rawValue
            )))
        )
        phoneInfoModelList.append(
            PhoneInfoModel(cellType: .buttonCell(model: ButtonTableViewCellModel(
                cellTitleLabel: PhoneInfoConstant.Cell.Title.damage.rawValue,
                buttonHandler: { [weak self] in
                    guard let self = self else { return }
                    self.navigationController?.pushViewController(self.phoneDamageVC, animated: true)
                }
            )))
        )
        
    }
}
