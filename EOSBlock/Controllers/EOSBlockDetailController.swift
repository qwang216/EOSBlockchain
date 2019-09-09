//
//  EOSBlockDetailController.swift
//  EOSBlock
//
//  Created by Jason wang on 9/8/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import UIKit

class EOSBlockDetailController: UIViewController {

    let producerLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Producer"
        return lb
    }()

    let signatureLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Signature"
        lb.lineBreakMode = .byCharWrapping
        lb.numberOfLines = 0
        return lb
    }()

    let txnCountLabel: UILabel = {
        let lb = UILabel()
        lb.text = "20"
        return lb
    }()

    let textView: UITextView = {
        let tv = UITextView()
        tv.isEditable = false
        tv.isScrollEnabled = false
        tv.text = "JSON goes here"
        tv.sizeToFit()
        return tv
    }()

    let activityIndicator = EOSActivityView(frame: .zero)
    var viewModel: EOSDetailViewable?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
        viewModel?.fetchBlockDetail()
    }

    func updateView() {
        producerLabel.text = viewModel?.producer
        signatureLabel.text = viewModel?.signature
        txnCountLabel.text = viewModel?.txnCount
        textView.text = viewModel?.blockJSON
    }

    func setupView() {

        let scrollView = UIScrollView()
        view.addSubviews(scrollView, activityIndicator)
        activityIndicator.centerSuperview()
        scrollView.fillToSuperview()

        let vStack = UIStackView(arrangedSubviews: [producerLabel, signatureLabel, txnCountLabel, textView])
        vStack.axis = .vertical
        vStack.alignment = .leading
        vStack.distribution = .fillProportionally
        vStack.spacing = 5
        scrollView.addSubview(vStack)
        vStack.fillToSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
        vStack.setAnchor(width: scrollView.widthAnchor, padding: .init(width: 40, height: 0))
    }

}

extension EOSBlockDetailController: EOSViewModelDelegate {
    func viewModelUpdated() {
        updateView()
    }

    func loading(state: LoadingState<EOSManagerError>) {
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
