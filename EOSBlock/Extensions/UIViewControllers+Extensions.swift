//
//  UIViewControllers+Extensions.swift
//  EOSBlock
//
//  Created by Jason wang on 9/8/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import UIKit

extension UIViewController {

    func showAlert(_ error: LocalizedError) {
        showAlert(error.failureReason, msg: error.localizedDescription)
    }

    func showAlert(_ title: String? = "Oh No!", msg: String? = "Something went wrong") {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
