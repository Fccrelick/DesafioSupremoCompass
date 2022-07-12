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

    var localized: String { NSLocalizedString(rawValue, comment: "") }
}
