//
//  ItemType.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 16/07/22.
//

import Foundation

enum ItemType: String, Codable {
    case transferOut
    case transferIn
    case pixCashIn
    case pixCashOut
    case bankSlipCashIn

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        switch try container.decode(String.self) {
        case LocaleKeys.transferOut.localized:
            self = .transferOut
        case LocaleKeys.transferIn.localized:
            self = .transferIn
        case LocaleKeys.pixCashIn.localized:
            self = .pixCashIn
        case LocaleKeys.pixCashOut.localized:
            self = .pixCashOut
        case LocaleKeys.bankSlipCashIn.localized:
            self = .bankSlipCashIn
        default: fatalError()
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .transferOut:
            try container.encode(LocaleKeys.transferOut.localized)
        case .transferIn:
            try container.encode(LocaleKeys.transferIn.localized)
        case .pixCashIn:
            try container.encode(LocaleKeys.pixCashIn.localized)
        case .pixCashOut:
            try container.encode(LocaleKeys.pixCashOut.localized)
        case .bankSlipCashIn:
            try container.encode(LocaleKeys.bankSlipCashIn.localized)
        }
    }
}
