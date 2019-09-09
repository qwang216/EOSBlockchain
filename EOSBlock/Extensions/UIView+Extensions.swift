//
//  UIView+Extensions.swift
//  EOSBlock
//
//  Created by Jason wang on 9/7/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import UIKit

extension UIView {

    func addSubviews(_ views: UIView...) {
        views.forEach{ addSubview($0) }
    }
    
    @discardableResult
    func centerSuperview(offSetX: CGFloat = 0, offSetY: CGFloat = 0, size: CGSize = .zero) -> [NSLayoutConstraint] {
        guard let superview = superview else { return [] }
        var centerConstrains = center(view: superview)
        centerConstrains.append(contentsOf: anchor(size: size))
        return centerConstrains
    }

    @discardableResult
    func center(view: UIView, offSetX: CGFloat = 0, offSetY: CGFloat = 0) -> [NSLayoutConstraint] {
        anchor()
        let constraints =
            [centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: offSetX),
             centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: offSetY)]
        NSLayoutConstraint.activate(constraints)
        return constraints
    }
    
    @discardableResult
    func fillToSuperview(padding: UIEdgeInsets = .zero) -> [NSLayoutConstraint]{
        return anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor, padding: padding)
    }

    @discardableResult
    func setAnchor(width: NSLayoutDimension? = nil, height: NSLayoutDimension? = nil, padding: CGSize = .zero) -> [NSLayoutConstraint] {

        guard width != nil || height != nil else { return [] }
        anchor()
        var outputConstrains = [NSLayoutConstraint]()
        if let width = width {
            let widthConstrain = widthAnchor.constraint(equalTo: width, constant: -padding.width)
            outputConstrains.append(widthConstrain)
        }
        if let height = height {
            let heightConstrain = height.constraint(equalTo: height, constant: -padding.height)
            outputConstrains.append(heightConstrain)
        }
        NSLayoutConstraint.activate(outputConstrains)
        return outputConstrains
    }
    
    @discardableResult
    func anchor(top: NSLayoutYAxisAnchor? = nil, leading: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil, padding: UIEdgeInsets = .zero, size: CGSize = .zero) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false
        var outputConstrains = [NSLayoutConstraint]()
        if let top = top {
            let topConstrain = topAnchor.constraint(equalTo: top, constant: padding.top)
            outputConstrains.append(topConstrain)
        }
        if let leading = leading {
            let leadingConstrain = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
            outputConstrains.append(leadingConstrain)
        }
        if let bottom = bottom {
            let bottomConstrain = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
            outputConstrains.append(bottomConstrain)
        }
        if let trailing = trailing {
            let trailingConstrain = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
            outputConstrains.append(trailingConstrain)
        }
        if size.width != 0 {
            let widthConstrain = widthAnchor.constraint(equalToConstant: size.width)
            outputConstrains.append(widthConstrain)
        }
        if size.height != 0 {
            let heightConstrain = heightAnchor.constraint(equalToConstant: size.height)
            outputConstrains.append(heightConstrain)
        }
        NSLayoutConstraint.activate(outputConstrains)
        return outputConstrains
    }
}
