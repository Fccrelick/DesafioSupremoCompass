//
//  DetailViewModel.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 14/07/22.
//

import Foundation

struct DetailViewModel {
    let details: DetailStatementResponseModel

    let item: Item

    var isSameAccount: Bool {
        guard let item = item.itemType else {
            return false
        }

        switch item {
        case .transferOut:
            return false
        case .transferIn:
            return true
        case .pixCashIn:
            return true
        case .pixCashOut:
            return false
        case .bankSlipCashIn:
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

        return String(amount)
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
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy '-' HH:mm:ss"
        return formatter.string(from: details.date)
    }

    var authLabel: String? {
        return details.authentication
    }

    init(details: DetailStatementResponseModel, item: Item) {
        self.details = details
        self.item = item
    }
}
