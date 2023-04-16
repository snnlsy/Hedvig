//
//  PhoneInfoConstant.swift
//  Hedvig
//
//  Created by Sinan Ulusoy on 22.11.2022.
//

import UIKit

struct PhoneInfoConstant {
    
    struct NavigationBar {
        static let title = "Phone Info"
        static let backgroundColor = UIColor("#F6F6F6")
    }
    
    struct TableView {
        static let backgroundColor = UIColor("#FAFAFA")
    }
    
    struct Cell {
        static let backgroundColor = UIColor.white
        static let deleteIconColor = UIColor("#777777")
        
        enum Title: String {
            case model = "Model"
            case date = "Date of purchase"
            case price = "Price of purchase"
            case damage = "Damage"
        }
        
        enum Expalanation: String {
            case price = "Estimated based on price history of this model."
        }
    }
}
