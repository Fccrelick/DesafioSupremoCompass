//
//  MyStatementViewModel.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 11/07/22.
//

import Foundation


protocol StatementViewModel {
    var MyStatements: [Item]? { set get }
    var onFetchStatementSucceed: (() -> Void)? { set get }
    var onFetchStatementFailure: ((Error) -> Void)? { set get }
    func fetchMyStatement(pagination: Bool)
}

final class MyStatementViewModel: StatementViewModel {
    private let networkService: NetworkService

    var MyStatements: [Item]?

    var onFetchStatementSucceed: (() -> Void)?

    var onFetchStatementFailure: ((Error) -> Void)?

    var paginationIndex = 0

    var isPaginating = false

    init(networkService: NetworkService) {
        self.networkService = networkService
        fetchMyStatement(pagination: false)
    }

    func fetchMyStatement(pagination: Bool = false) {
        let request = MyStatementRequest(index: paginationIndex)

        if pagination{
            isPaginating = true
        }

        networkService.request(request) { [weak self] result in
            switch result {
            case .success(let statements):
                if (self?.MyStatements) != nil {
                    self?.MyStatements?.append(contentsOf: statements.items)

                } else {
                    self?.MyStatements = statements.items

                }

                self?.onFetchStatementSucceed?()

                if pagination {
                    self?.isPaginating = false
                }

                self?.paginationIndex += 1
            case .failure(let error):
                self?.onFetchStatementFailure?(error)

                if pagination {
                    self?.isPaginating = false
                }

            }
        }
    }
}
