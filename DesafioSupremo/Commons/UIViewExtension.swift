//
//  UIViewExtension.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 11/07/22.
//

import UIKit

extension UIView {
    @discardableResult
    func addConstraintsWithFormat(_ format: String, views: UIView..., metrics: [String: Any]? = nil) -> UIView {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }

        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format,
                                                      options: NSLayoutConstraint.FormatOptions(),
                                                      metrics: metrics,
                                                      views: viewsDictionary))

        return self
    }

    @discardableResult
    public func anchorVertical(top: NSLayoutYAxisAnchor? = nil,
                               bottom: NSLayoutYAxisAnchor? = nil,
                               topConstant: CGFloat = 0,
                               bottomConstant: CGFloat = 0) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false

        var anchors = [NSLayoutConstraint]()

        if let top = top {
            anchors.append(topAnchor.constraint(equalTo: top, constant: topConstant))
        }

        if let bottom = bottom {
            anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant))
        }

        NSLayoutConstraint.activate(anchors)

        return self
    }

    @discardableResult
    public func anchorVerticalWithMultiplier(top: NSLayoutYAxisAnchor? = nil,
                                             bottom: NSLayoutYAxisAnchor? = nil,
                                             topMultiplier: CGFloat = 1,
                                             bottomMultiplier: CGFloat = 1) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false

        var anchors = [NSLayoutConstraint]()

        if let top = top {
            anchors.append(topAnchor.constraint(equalToSystemSpacingBelow: top, multiplier: topMultiplier))
        }

        if let bottom = bottom {
            anchors.append(bottomAnchor.constraint(equalToSystemSpacingBelow: bottom, multiplier: -bottomMultiplier))
        }

        NSLayoutConstraint.activate(anchors)

        return self
    }

    @discardableResult
    public func anchorHorizontal(left: NSLayoutXAxisAnchor? = nil,
                                 right: NSLayoutXAxisAnchor? = nil,
                                 leftConstant: CGFloat = 0,
                                 rightConstant: CGFloat = 0) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false

        var anchors = [NSLayoutConstraint]()

        if let left = left {
            anchors.append(leftAnchor.constraint(equalTo: left, constant: leftConstant))
        }

        if let right = right {
            anchors.append(rightAnchor.constraint(equalTo: right, constant: -rightConstant))
        }

        NSLayoutConstraint.activate(anchors)

        return self
    }

    @discardableResult
    public func anchorSize(widthConstant: CGFloat = 0, heightConstant: CGFloat = 0) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false

        var anchors = [NSLayoutConstraint]()

        if widthConstant > 0 {
            anchors.append(widthAnchor.constraint(equalToConstant: widthConstant))
        }

        if heightConstant > 0 {
            anchors.append(heightAnchor.constraint(equalToConstant: heightConstant))
        }

        NSLayoutConstraint.activate(anchors)

        return self
    }

    @discardableResult
    public func anchorSize(width: NSLayoutDimension? = nil,
                           widthConstant: CGFloat = 0,
                           height: NSLayoutDimension? = nil,
                           heightConstant: CGFloat = 0) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false

        var anchors = [NSLayoutConstraint]()

        if let width = width {
            anchors.append(widthAnchor.constraint(equalTo: width, constant: widthConstant))
        }

        if let height = height {
            anchors.append(heightAnchor.constraint(equalTo: height, constant: heightConstant))
        }

        NSLayoutConstraint.activate(anchors)

        return self
    }

    @discardableResult
    public func anchorSizeWithMultiplier(width: NSLayoutDimension? = nil,
                                         widthMultiplier: CGFloat = 1,
                                         height: NSLayoutDimension? = nil,
                                         heightMultiplier: CGFloat = 1) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false

        var anchors = [NSLayoutConstraint]()

        if let width = width {
            anchors.append(widthAnchor.constraint(equalTo: width, multiplier: widthMultiplier))
        }

        if let height = height {
            anchors.append(heightAnchor.constraint(equalTo: height, multiplier: heightMultiplier))
        }

        NSLayoutConstraint.activate(anchors)

        return self
    }

    @discardableResult
    public func fillSuperview(top: CGFloat = 0,
                              bottom: CGFloat = 0,
                              left: CGFloat = 0,
                              right: CGFloat = 0) -> UIView {
        fillSuperviewWidth(left: left, right: right)
        fillSuperviewHeight(top: top, bottom: bottom)

        return self
    }

    @discardableResult
    public func fillSuperviewWidth(left: CGFloat = 0, right: CGFloat = 0) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false

        if let superview = superview {
            NSLayoutConstraint.activate([
                leftAnchor.constraint(equalTo: superview.leftAnchor, constant: left),
                rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -right)
            ])
        }

        return self
    }

    @discardableResult
    public func fillSuperviewHeight(top: CGFloat = 0, bottom: CGFloat = 0) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false

        if let superview = superview {
            NSLayoutConstraint.activate([
                topAnchor.constraint(equalTo: superview.topAnchor, constant: top),
                bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -bottom)
            ])
        }

        return self
    }

    @discardableResult
    public func anchorCenterXToSuperview(constant: CGFloat = 0) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false

        if let anchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }

        return self
    }

    @discardableResult
    public func anchorCenterYToSuperview(constant: CGFloat = 0) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false

        if let anchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }

        return self
    }

    @discardableResult
    public func anchorCenterToSuperview() -> UIView {
        anchorCenterXToSuperview()
        anchorCenterYToSuperview()

        return self
    }

    @discardableResult
    public func anchorCenterX(to view: UIView, constant: CGFloat = 0) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false

        centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant).isActive = true

        return self
    }

    @discardableResult
    public func anchorCenterY(to view: UIView, constant: CGFloat = 0) -> UIView {
        translatesAutoresizingMaskIntoConstraints = false

        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true

        return self
    }
}
