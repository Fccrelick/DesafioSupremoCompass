//
//  DetailViewModel.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 14/07/22.
//

import Foundation

struct DetailViewModel {
    let details: DetailStatementResponseModel

    var transferTypeLabel: String? {
        return details.tType
    }

    var valueLabel: String? {
        guard let amount = details.amount else {
            return nil
        }
        return String(amount)
    }

    var toLabel: String? {
        return details.from
    }

    var bankLabel: String? {
        return details.bankName
    }

    var dateLabel: String? {
        return details.createdAt
    }

    var authLabel: String? {
        return details.authentication
    }

    init(details: DetailStatementResponseModel) {
        self.details = details
    }
}
