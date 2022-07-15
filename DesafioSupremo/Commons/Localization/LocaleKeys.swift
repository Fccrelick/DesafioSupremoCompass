//
//  LocaleKeys.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 12/07/22.
//

import Foundation

enum LocaleKeys: String {
    // MARK: - StatementController
    case statementTitle

    // MARK: - StatementHeaderView
    case balanceLocalizedLabel
    case yourTransactionsLabel

    // MARK: - StatementTableViewCell
    case pixLabel

    // MARK: - DetailView
    case titleLabel
    case transactionTypeLocalized
    case valueLocalized
    case toLocalized
    case bankLocalized
    case dateLocalized
    case authLocalized
    case yourAccount

    var localized: String { NSLocalizedString(rawValue, comment: "") }
}
