//
//  SpinnerFooterView.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 15/07/22.
//

import UIKit

final class SpinnerFooterView: UIView {
    // MARK: - Views

    private lazy var footerView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: 100))

    private lazy var spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.center = footerView.center

        return spinner
    }()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle

    override func layoutSubviews() {
        addSubview(footerView)
        footerView.addSubview(spinner)
        spinner.startAnimating()
    }

    override func removeFromSuperview() {
        super.removeFromSuperview()

        spinner.stopAnimating()
    }
}
