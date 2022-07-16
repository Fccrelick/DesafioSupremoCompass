//
//  LocaleKeys.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 12/07/22.
//

import Foundation

enum LocaleKeys: String {
    // MARK: - GenericAlert
    case AlertTitle
    case tryAgain
    case alertButtonTitle

    // MARK: - APIDateFormat
    case apiDateFormat

    // MARK: - ItemTypeEnum
    case transferOut
    case transferIn
    case pixCashIn
    case pixCashOut
    case bankSlipCashIn

    // MARK: - StatementController
    case statementTitle

    // MARK: - StatementHeaderView
    case balanceLocalizedLabel
    case yourTransactionsLabel

    // MARK: - StatementTableViewCell
    case pixLabel
    case statementDateFormat

    // MARK: - DetailView
    case titleLabel
    case transactionTypeLocalized
    case valueLocalized
    case toLocalized
    case bankLocalized
    case dateLocalized
    case authLocalized
    case yourAccount
    case detailDateFormat

    var localized: String { NSLocalizedString(rawValue, comment: "") }
}
