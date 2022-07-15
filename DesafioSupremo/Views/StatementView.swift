//
//  StatementView.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 14/07/22.
//

import UIKit

final class StatementView: UIView {
    // MARK: - Properties
     var balance: String? {
         get{ return balanceView.balance }
         set{ balanceView.balance = newValue }
    }

    private let balanceView: BalanceView = {
        let view = BalanceView()

        return view
    }()

    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)

        return tableView
    }()

    // MARK: - Initializers
    override init(frame: CGRect) {
    super.init(frame: frame)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Helpers
    func adjustBalanceViewToNavBar(anchor: NSLayoutYAxisAnchor) {
        balanceView.anchorVertical(top: anchor)
    }
}

// MARK: - View Coding

extension StatementView: ViewCoding{
    func buildViewHierarchy() {
        addSubview(balanceView)
        addSubview(tableView)
    }

    func setupConstraints() {
        balanceView
            .anchorHorizontal(left: leftAnchor, right: rightAnchor)
            .anchorSize(heightConstant: 150)

        tableView
            .anchorHorizontal(left: leftAnchor, right: rightAnchor)
            .anchorVertical(top: balanceView.bottomAnchor, bottom: safeAreaLayoutGuide.bottomAnchor)
    }
}
