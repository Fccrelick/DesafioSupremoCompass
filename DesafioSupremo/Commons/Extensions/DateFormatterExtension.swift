//
//  DateFormatterExtension.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 16/07/22.
//

import Foundation

extension DateFormatter {
    static let apiDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = LocaleKeys.apiDateFormat.localized

        return dateFormatter
    }()

    static let statementDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = LocaleKeys.statementDateFormat.localized

        return dateFormatter
    }()

    static let detailDateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = LocaleKeys.detailDateFormat.localized

        return dateFormatter
    }()
}
