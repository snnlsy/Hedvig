//
//  ViewController.swift
//  Hedvig
//
//  Created by Sinan Ulusoy on 22.11.2022.
//

import UIKit

final class ViewController: UIViewController {
    
    private let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkGray
        button.setTitle("Go Phone Info Page", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        view.backgroundColor = .gray
        view.addSubview(button)
        button.center = view.center
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc private func didTapButton() {
        let phoneInfoVC = PhoneInfoViewController()
        let navigationController = UINavigationController(rootViewController: phoneInfoVC)
        present(navigationController, animated: true)
    }
}
