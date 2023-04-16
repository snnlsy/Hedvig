//
//  ReusableViewProtocol.swift
//  Hedvig
//
//  Created by Sinan Ulusoy on 30.11.2022.
//

import Foundation

protocol ReusableViewProtocol {

    static var reuseIdentifier: String { get }
}

extension ReusableViewProtocol {

    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
