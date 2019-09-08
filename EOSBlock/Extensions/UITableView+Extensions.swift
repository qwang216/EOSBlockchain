//
//  UITableView+Extensions.swift
//  EOSBlock
//
//  Created by Jason wang on 9/8/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import UIKit

extension UITableView {

    func register<T: EOSBaseCell>(_ cell: T.Type) where T: ReusesableView {
        register(T.self, forCellReuseIdentifier: T.identifier)
    }

    func dequeueCell<T: EOSBaseCell>(indexPath: IndexPath) -> T where T: ReusesableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Unable to dequeue Cell with ID: \(T.identifier)")
        }
        return cell
    }

}
