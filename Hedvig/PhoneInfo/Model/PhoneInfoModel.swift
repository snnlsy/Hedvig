//
//  PhoneInfoModel.swift
//  Hedvig
//
//  Created by Sinan Ulusoy on 23.11.2022.
//

import Foundation


struct PhoneInfoModel {
    var cellType: CellTypeModel
}

enum CellTypeModel {
    case modelCell(model: ModelTableViewCellModel)
    case priceCell(model: PriceTableViewCellModel)
    case buttonCell(model: ButtonTableViewCellModel)
    case dateCell(model: DateTableViewCellModel)
    
    func adjust(damageType: String) {
        switch self {
        case .buttonCell(model: let model):
            model.cellTitleLabel = damageType
        default:
            return
        }
    }
}

final class ModelTableViewCellModel {
    var cellTitleLabel: String
    
    init(cellTitleLabel: String) {
        self.cellTitleLabel = cellTitleLabel
    }
}

final class PriceTableViewCellModel {
    let cellTitleLabel: String
    let explanationLabel: String
    
    init(cellTitleLabel: String, explanationLabel: String) {
        self.cellTitleLabel = cellTitleLabel
        self.explanationLabel = explanationLabel
    }
}

final class ButtonTableViewCellModel {
    var cellTitleLabel: String
    let buttonHandler: (() -> Void)
    
    init(cellTitleLabel: String, buttonHandler: @escaping () -> Void) {
        self.cellTitleLabel = cellTitleLabel
        self.buttonHandler = buttonHandler
    }
}

final class DateTableViewCellModel {
    let cellTitleLabel: String
    
    init(cellTitleLabel: String) {
        self.cellTitleLabel = cellTitleLabel
    }
}
