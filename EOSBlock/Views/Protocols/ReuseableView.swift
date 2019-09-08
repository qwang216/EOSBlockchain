//
//  ReuseableView.swift
//  EOSBlock
//
//  Created by Jason wang on 9/8/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import UIKit

protocol ReusesableView { }
extension ReusesableView where Self: Identifiable {
    static var identifier: String {
        return String(describing: self)
    }
}
