//
//  StatementCellViewModel.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 12/07/22.
//

import Foundation

struct StatementCellViewModel {
    let item: Item

    var infoLabelText: String? {
        return item.description
    }

    var nameToLabelText: String? {
        return item.to
    }

    var amountLabelText: String? {
        guard let value = item.amount else { return nil }
        return "R$ \(value),00"
    }

    var dateLabel: String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM"
        return formatter.string(from: item.date)
    }

    var isPix: Bool {
        guard let itemType = item.itemType else {
            return false
        }

        switch itemType {
        case .transferOut:
            return false
        case .transferIn:
            return false
        case .pixCashIn:
            return true
        case .pixCashOut:
            return true
        case .bankSlipCashIn:
            return false
        }
    }

    init(item: Item){
        self.item = item
    }
}
