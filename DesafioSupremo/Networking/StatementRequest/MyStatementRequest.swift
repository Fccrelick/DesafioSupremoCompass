//
//  MyStatementRequest.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 11/07/22.
//

import Foundation

struct MyStatementRequest: DataRequest {
    typealias Response = MyStatementResponseModel

    var url: String = {
        let baseURL: String = "https://bank-statement-bff.herokuapp.com"
        let path: String = "/myStatement/10/"
        return baseURL + path
    }()

    var method: HTTPMethod {
        .get
    }

    var headers: [String : String] {
        [
            "token" : LocaleKeys.token.localized
        ]
    }

    init(index: Int) {
        self.url = url + String(index)
    }

    func decode(_ data: Data) throws -> Response {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.apiDateFormatter)
        let response = try decoder.decode(MyStatementResponseModel.self, from: data)
        return response
    }
}
