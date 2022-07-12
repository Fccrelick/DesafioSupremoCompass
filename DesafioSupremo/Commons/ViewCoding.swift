//
//  ViewCoding.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 11/07/22.
//

import Foundation

public protocol ViewCoding {
    /// Method for setup subviews on the view
    func buildViewHierarchy()

    /// Method for setup constraints on subviews
    func setupConstraints()

    /// Method to make additonal configuration on view
    func setupAdditionalConfiguration()

    /// Method that call all others auxiliary methodes
    func setupView()
}

extension ViewCoding {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }

    func setupAdditionalConfiguration() {}
}
