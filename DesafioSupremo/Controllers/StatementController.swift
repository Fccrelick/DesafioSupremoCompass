//
//  StatementController.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 11/07/22.
//

import UIKit

private let reuseIdentifier = "StatementTableViewCell"

final class StatementController: UIViewController, Coordinating {
    // MARK: - Properties
    let statementView = StatementView()

    var coordinator: Coordinator?

    var balanceViewModel: MyBalanceViewModel {
        didSet{ refreshDisplay() }
    }

    var statementViewModel: MyStatementViewModel {
        didSet { refreshDisplay() }
    }

    var viewAppeared = false

    // MARK: - Initializers
     init(balanceViewModel: MyBalanceViewModel, statementViewModel: MyStatementViewModel) {
        self.balanceViewModel = balanceViewModel
        self.statementViewModel = statementViewModel
         super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func loadView() {
        view = statementView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        statementView.tableView.delegate = self
        statementView.tableView.dataSource = self
        setupTableView()
        refreshDisplay()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if let rect = self.navigationController?.navigationBar {
            statementView.adjustBalanceViewToNavBar(anchor: rect.bottomAnchor)
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        viewAppeared = true
    }

    // MARK: - Helpers
    private func refreshDisplay() {
        balanceViewModel.onFetchBalanceSucceed = {
            DispatchQueue.main.async {
                let query = KeychainHelper.standard.read(service: "balance")
                if let balance = query?.toInt() {
                    self.statementView.balance = "R$ \(balance),00"
                }

                self.statementView.tableView.reloadData()
            }
        }

        statementViewModel.onFetchStatementSucceed = {
            DispatchQueue.main.async {
                self.statementView.tableView.tableFooterView = nil
                self.statementView.tableView.reloadData()
            }
        }
    }

    private func setupTableView() {
        view.backgroundColor = ColorPalette.white
        title = LocaleKeys.statementTitle.localized
        statementView.tableView.register(StatementTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        statementView.tableView.backgroundColor = ColorPalette.white
        statementView.tableView.separatorStyle = .none
    }
}

// MARK: - UITableViewDataSource

extension StatementController: UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let items = statementViewModel.MyStatements else { return 0 }
        return items.count
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as?
                StatementTableViewCell else {
            return UITableViewCell()
        }

        cell.item = statementViewModel.MyStatements?[indexPath.row]

        return cell
    }
}

// MARK: - UITableViewDelegate

extension StatementController: UITableViewDelegate {
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let items = statementViewModel.MyStatements else { return }
        tableView.deselectRow(at: indexPath, animated: true)
        coordinator?.eventOccurred(with: .statementCellTapped(item: items[indexPath.row]))
    }

     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let value = Int(view.frame.height * 0.65) / 5
        return CGFloat(value)
    }
}

// MARK: - ScrollViewDelegate

extension StatementController: UIScrollViewDelegate {
     func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
         if position > (self.statementView.tableView.contentSize.height-50-scrollView.frame.size.height) {

            guard !statementViewModel.isPaginating else {
                return
            }

            if viewAppeared {

                self.statementView.tableView.tableFooterView = SpinnerFooterView()

                statementViewModel.fetchMyStatement(pagination: true)
            }
        }
    }
}
