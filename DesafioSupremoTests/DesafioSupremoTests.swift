//
//  DesafioSupremoTests.swift
//  DesafioSupremoTests
//
//  Created by Fernando Crelick on 16/07/22.
//

import XCTest
@testable import DesafioSupremo

class DesafioSupremoTests: XCTestCase {

    func testFetchBalance() {
        let balanceViewModel = MockBalanceViewModel(networkService: DefaultNetworkService())

        balanceViewModel.fetchMyBalance()
        XCTAssertTrue(balanceViewModel.isFetchMyBalanceCalled)
    }

}

class MockBalanceViewModel: BalanceViewModel {

    private let networkService: NetworkService

    var amount: Int?

    var delegate: BalanceFetchResultDelegate?

    var isFetchMyBalanceCalled = false

    init(networkService: NetworkService){
        self.networkService = networkService

    }

    func fetchMyBalance() {
        isFetchMyBalanceCalled = true
        let request = MyBalanceRequest()
        networkService.request(request) { result in
        }
        }
}
