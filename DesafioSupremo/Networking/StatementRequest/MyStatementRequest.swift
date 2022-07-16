//
//  MyStatementRequest.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 11/07/22.
//

import Foundation

struct MyStatementRequest: DataRequest {
    typealias Response = MyStatementResponseModel

    private let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c"

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
            "token" : token
        ]
    }

    init(index: Int) {
        self.url = url + String(index)
    }

    func decode(_ data: Data) throws -> Response {
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = LocaleKeys.apiDateFormat.localized
        decoder.dateDecodingStrategy = .formatted(formatter)
        let response = try decoder.decode(MyStatementResponseModel.self, from: data)
        return response
    }
}
