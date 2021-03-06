//
//  DetailStatementViewModel.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 14/07/22.
//

import Foundation

protocol DetailStatementViewModel {
    var item: Item { get }
    var details: DetailStatementResponseModel? { get }
    var delegate: DetailFetchResultDelegate? { get set }
    func fetchMyStatement()
}

protocol DetailFetchResultDelegate: AnyObject {
    func detailFetchSuccess()
    func detailFetchFailure(error: Error)
}

final class MyDetailStatementViewModel: DetailStatementViewModel {
    // MARK: - Instance Properties

    private let networkService: NetworkService

    weak var delegate: DetailFetchResultDelegate?

    var item: Item

    var details: DetailStatementResponseModel?

    // MARK: - Initialization

    init(networkService: NetworkService, item: Item){
        self.networkService = networkService
        self.item = item

    }

    // MARK: - Functions
    func fetchMyStatement() {
        guard let ID = item.id else {
            return
        }

        let request = DetailStatementRequest(id: ID)
        networkService.request(request) { [weak self] result in
            switch result{
            case .success(let details):
                self?.details = details
                self?.delegate?.detailFetchSuccess()
            case .failure(let error):
                self?.delegate?.detailFetchFailure(error: error)
            }
        }
    }
}
