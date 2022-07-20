//
//  MyStatementViewModel.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 11/07/22.
//

import Foundation

protocol StatementViewModel {
    var MyStatements: [Item]? { set get }
    var delegate: StatementFetchResultDelegate? { get set }
    var paginationIndex: Int { set get }
    var isPaginating: Bool { get }
    func fetchMyStatement(pagination: Bool)
}

protocol StatementFetchResultDelegate: AnyObject {
    func StatementFetchSuccess()
    func StatementFetchFailure(error: Error)
}

final class MyStatementViewModel: StatementViewModel {
    // MARK: - Instance Properties

    private let networkService: NetworkService

    weak var delegate: StatementFetchResultDelegate?

    var MyStatements: [Item]?

    var onFetchStatementSucceed: (() -> Void)?

    var onFetchStatementFailure: ((Error) -> Void)?

    var paginationIndex = 0

    var isPaginating = false

    // MARK: - Initialization

    init(networkService: NetworkService) {
        self.networkService = networkService

    }

    // MARK: - Functions

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

                self?.delegate?.StatementFetchSuccess()

                if pagination {
                    self?.isPaginating = false
                }

                self?.paginationIndex += 1
            case .failure(let error):
                self?.delegate?.StatementFetchFailure(error: error)

                if pagination {
                    self?.isPaginating = false
                }

            }
        }
    }
}
