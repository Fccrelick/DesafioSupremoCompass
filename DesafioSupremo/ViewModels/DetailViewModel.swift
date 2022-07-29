//
//  DetailViewModel.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 14/07/22.
//

import Foundation

struct DetailViewModel {
    // MARK: - Instance Properties

    let details: DetailStatementResponseModel

    let item: Item

    var isSameAccount: Bool {

        switch item.tType {
        case .transferOut:
            return false
        case .pixCashOut:
            return false
        default:
            return true
        }

    }

    var transferTypeLabel: String? {
        return details.description
    }

    var valueLabel: String? {
        guard let amount = details.amount else {
            return nil
        }

        return "R$ \(amount),00"
    }

    var toLabel: String? {
        if isSameAccount{
            return LocaleKeys.yourAccount.localized
        }

        return item.to
    }

    var bankLabel: String? {
        return item.bankName ?? details.bankName
    }

    var dateLabel: String? {
        guard let date = details.createdAt else {
            return nil
        }

        return DateFormatter.detailDateFormatter.string(from: date)
    }

    var authLabel: String? {
        return details.authentication
    }

    // MARK: - Initialization

    init(details: DetailStatementResponseModel, item: Item) {
        self.details = details
        self.item = item
    }
}
