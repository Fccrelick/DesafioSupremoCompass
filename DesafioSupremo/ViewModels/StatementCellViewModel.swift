//
//  StatementCellViewModel.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 12/07/22.
//

import Foundation

struct StatementCellViewModel {
    // MARK: - Instance Properties

    let item: Item

    var infoLabelText: String? {
        return item.description
    }

    var nameToLabelText: String? {
        guard item.to != nil else {
            return LocaleKeys.yourAccount.localized
        }

        return item.to
    }

    var amountLabelText: String? {
        guard let value = item.amount else {
            return nil
        }

        return "R$ \(value),00"
    }

    var dateLabel: String? {
        guard let date = item.createdAt else {
            return nil
        }

        return DateFormatter.statementDateFormatter.string(from: date)
    }

    var isPix: Bool {

        switch item.tType {
        case .pixCashIn:
            return true
        case .pixCashOut:
            return true
        default:
            return false
        }

    }

    // MARK: - Initialization

    init(item: Item){
        self.item = item
    }
}
