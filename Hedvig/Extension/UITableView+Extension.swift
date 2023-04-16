//
//  UITableView+Extension.swift
//  Hedvig
//
//  Created by Sinan Ulusoy on 23.11.2022.
//

import UIKit

extension UITableView {

    func reloadDataAsync() {
        DispatchQueue.main.async { [weak self] in
            self?.reloadData()
        }
    }
    
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to Dequeue Reusable Table View Cell")
        }
        return cell
    }
    
    func register(_ type: UITableViewCell.Type) {
        register(type, forCellReuseIdentifier: type.reuseIdentifier)
    }
}
