//
//  MyBalanceViewModel.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 11/07/22.
//

import Foundation

protocol BalanceViewModel {
    var amount: Int? { set get }
    var delegate: BalanceFetchResultDelegate? { set get }
    func fetchMyBalance()
}

protocol BalanceFetchResultDelegate: AnyObject {
    func balanceFetchSuccess()
    func balanceFetchFailure(error: Error)
}

final class MyBalanceViewModel: BalanceViewModel {
    // MARK: - Instance Properties

    private let networkService: NetworkService

    weak var delegate: BalanceFetchResultDelegate?

    var amount: Int?

    // MARK: - Initialization

    init(networkService: NetworkService){
        self.networkService = networkService
        fetchMyBalance()
    }

    // MARK: - Functions

    func fetchMyBalance() {
        let request = MyBalanceRequest()
        networkService.request(request) { [weak self] result in
            switch result {
            case .success(let amount):
                KeychainHelper.standard.save(amount.amount.toData(), service: "balance")
                self?.delegate?.balanceFetchSuccess()
            case .failure(let error):
                self?.delegate?.balanceFetchFailure(error: error)
            }
        }
    }
}

