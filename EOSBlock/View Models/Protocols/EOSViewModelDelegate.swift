//
//  EOSViewModelDelegate.swift
//  EOSBlock
//
//  Created by Jason wang on 9/9/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import UIKit

protocol EOSViewModelDelegate: class {
    func viewModelUpdated()
    func loading(state: LoadingState<Error>)
}

extension EOSViewModelDelegate where Self: LoaderableView,
                                     Self: UIViewController {

    func loading(state: LoadingState<Error>) {
        switch state {
        case .start:
            activityIndicator.startAnimating()
        case .stop(status: let status):
            activityIndicator.stopAnimating()
            guard case let .failure(err: err) = status else { return }
            showAlert(err)
        }
    }
}
