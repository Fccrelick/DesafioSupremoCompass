//
//  StatementController.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 11/07/22.
//

import UIKit

private let reuseIdentifier = "StatementTableViewCell"

class StatementController: UITableViewController, Coordinating {
    // MARK: - Properties
    var coordinator: Coordinator?

    var balanceViewModel: MyBalanceViewModel? {
        didSet{ refreshDisplay() }
    }

    var statementViewModel: MyStatementViewModel? {
        didSet { refreshDisplay() }
    }

    // MARK: - Initializers
    init(balanceViewModel: MyBalanceViewModel, statementViewModel: MyStatementViewModel){
        self.balanceViewModel = balanceViewModel
        self.statementViewModel = statementViewModel
        super.init(style: .plain)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        refreshDisplay()
    }

    // MARK: - Helpers
    private func refreshDisplay() {
        guard let balanceViewModel = balanceViewModel else {
            return
        }

        guard let statementViewModel = statementViewModel else {
            return
        }

        balanceViewModel.onFetchBalanceSucceed = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }

        statementViewModel.onFetchStatementSucceed = {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    private func setupTableView() {
        view.backgroundColor = ColorPalette.white
        title = LocaleKeys.statementTitle.localized
        tableView.register(StatementTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.backgroundColor = ColorPalette.white
        tableView.separatorStyle = .none
    }
}

// MARK: - UITableViewDataSource

extension StatementController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let statementViewModel = statementViewModel else { return 0 }
        guard let items = statementViewModel.MyStatements else { return 0 }
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as?
                StatementTableViewCell,
              let statementViewModel = statementViewModel else {
            return UITableViewCell()
        }

        cell.item = statementViewModel.MyStatements?[indexPath.row]

        return cell
    }
}

// MARK: - UITableViewDelegate

extension StatementController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let statementViewModel = statementViewModel else { return }
        guard let items = statementViewModel.MyStatements else { return }
        tableView.deselectRow(at: indexPath, animated: true)
        coordinator?.eventOccurred(with: .statementCellTapped(item: items[indexPath.row]))
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = StatementHeaderView()
        if let balance = balanceViewModel, let amount = balance.amount {
            view.balance = "R$ \(amount),00"
        }
        return view
    }

    override func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        300
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let value = Int(view.frame.height * 0.65) / 5
        return CGFloat(value)
    }
}
