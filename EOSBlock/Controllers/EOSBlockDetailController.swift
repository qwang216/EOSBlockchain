//
//  EOSBlockDetailController.swift
//  EOSBlock
//
//  Created by Jason wang on 9/8/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import UIKit

class EOSBlockDetailController: UIViewController, LoaderableView {

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

    let toggle = UISwitch(frame: .zero)
    let scrollView = UIScrollView()
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
        view.addSubviews(scrollView, activityIndicator)
        scrollView.fillToSuperview()
        activityIndicator.centerSuperview()
        setupVerticleStackView()
    }

    private func setupVerticleStackView() {
        let toggleStack = toggleStackView()
        let vStack = UIStackView(arrangedSubviews: [producerLabel, signatureLabel, txnCountLabel, toggleStack, textView])
        scrollView.addSubview(vStack)
        vStack.axis = .vertical
        vStack.alignment = .fill
        vStack.distribution = .fillProportionally
        vStack.spacing = 5
        vStack.fillToSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
        vStack.setAnchor(width: scrollView.widthAnchor, padding: .init(width: 40, height: 0))
    }

    private func toggleStackView() -> UIStackView {
        let toggleLabel = UILabel()
        toggleLabel.text = "Show Raw JSON:"
        textView.isHidden = !toggle.isOn
        toggle.addTarget(self, action: #selector(handleToggleAction), for: .valueChanged)
        let toggleStackView = UIStackView(arrangedSubviews: [toggleLabel ,toggle])
        toggleStackView.axis = .horizontal
        toggleStackView.distribution = .equalCentering
        return toggleStackView
    }

    @IBAction func handleToggleAction(toggle: UISwitch) {
        textView.isHidden = !toggle.isOn
    }

}

extension EOSBlockDetailController: EOSViewModelDelegate {

    func viewModelUpdated() {
        updateView()
    }

}
