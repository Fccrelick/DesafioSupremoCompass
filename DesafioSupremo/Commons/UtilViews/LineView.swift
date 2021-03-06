//
//  LineView.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 14/07/22.
//

import UIKit

final class LineView: UIView {
    // MARK: - Views

    private var line: UIView = {
        let view = UIView()
        view.backgroundColor = ColorPalette.cyan

        return view
    }()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Coding

extension LineView: ViewCoding {
    func buildViewHierarchy() {
        addSubview(line)
    }

    func setupConstraints() {
        line
            .anchorHorizontal(left: leftAnchor, right: rightAnchor)
            .anchorCenterY(to: self)
            .anchorSize(heightConstant: 2)
    }
}
