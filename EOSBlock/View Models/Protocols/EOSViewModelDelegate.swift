//
//  EOSViewModelDelegate.swift
//  EOSBlock
//
//  Created by Jason wang on 9/9/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import Foundation

protocol EOSViewModelDelegate: class {
    func viewModelUpdated()
    func loading(state: LoadingState<EOSManagerError>)
}
