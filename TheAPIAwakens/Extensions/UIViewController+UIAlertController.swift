//
//  UIViewController+UIAlertController.swift
//  TheAPIAwakens
//
//  Created by Dennis Parussini on 24.11.19.
//  Copyright © 2019 Dennis Parussini. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(okAction)
        
        present(alert, animated: true)
    }
}
