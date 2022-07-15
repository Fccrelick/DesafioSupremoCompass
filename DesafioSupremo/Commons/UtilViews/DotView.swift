//
//  DotView.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 12/07/22.
//

import UIKit

final class DotView: UIView {
    override func layoutSubviews() {
            layer.cornerRadius = bounds.size.width/2
        }
}
