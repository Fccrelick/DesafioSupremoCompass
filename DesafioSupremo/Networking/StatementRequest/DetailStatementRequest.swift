//
//  DetailStatementRequest.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 14/07/22.
//

import Foundation

struct DetailStatementRequest: DataRequest {
    typealias Response = DetailStatementResponseModel

    private let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c"

    var url: String = {
        let baseURL: String = "https://bank-statement-bff.herokuapp.com"
        let path: String = "/myStatement/detail/"
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

    init(id: String) {
        self.url = url + id
    }

    func decode(_ data: Data) throws -> Response {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(DateFormatter.apiDateFormatter)
        let response = try decoder.decode(DetailStatementResponseModel.self, from: data)
        return response
    }
}
