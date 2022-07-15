//
//  DetailView.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 12/07/22.
//

import UIKit

class DetailView: UIView {
    // MARK: - Properties
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Comprovante"

        return label
    }()

    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorPalette.black

        return view
    }()

    private let transactionTypeLocalized: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.text = "Tipo de movimentação"

        return label
    }()

    private let transactionTypeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)

        return label
    }()

    private let transactionTypeStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.distribution = .fillEqually

        return stackView
    }()

    private let valueLocalized: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.text = "Valor"

        return label
    }()

    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)

        return label
    }()

    private let valueStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.distribution = .fillEqually

        return stackView
    }()

    private let toLocalized: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.text = "Recebedor"

        return label
    }()

    private let toLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)

        return label
    }()

    private let toStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.distribution = .fillEqually

        return stackView
    }()

    private let bankLocalized: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.text = "Instituição bancária"

        return label
    }()

    private let bankLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)

        return label
    }()

    private let bankStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.distribution = .fillEqually

        return stackView
    }()
    
    private let dateLocalized: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.text = "Data/Hora"

        return label
    }()

    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)

        return label
    }()

    private let dateStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.distribution = .fillEqually

        return stackView
    }()

    private let authLocalized: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 14)
        label.text = "Autenticação"

        return label
    }()

    private let authLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)

        return label
    }()

    private let authStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.distribution = .fillEqually

        return stackView
    }()

    private let stacksContainerView: UIView = {
        let view = UIView()

        return view
    }()

    private let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 40

        return stackView
    }()

    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = ColorPalette.cyan
        button.setTitleColor(ColorPalette.white, for: .normal)
        button.setTitle("Compartilhar", for: .normal)

        return button
    }()

    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Selectors
    @objc
    func handleShareTapped() {
        
    }

    // MARK: - Helpers
    func configure(withViewModel detailViewModel: DetailViewModel) {
        transactionTypeLabel.text = detailViewModel.transferTypeLabel
        valueLabel.text = detailViewModel.valueLabel
        toLabel.text = detailViewModel.toLabel
        bankLabel.text = detailViewModel.bankLabel
        dateLabel.text = detailViewModel.dateLabel
        authLabel.text = detailViewModel.authLabel
    }
}

// MARK: - ViewCoding

extension DetailView: ViewCoding {
    func buildViewHierarchy() {
        addSubview(titleLabel)
        addSubview(lineView)
        stacksContainerView.addSubview(transactionTypeStackView)
        stacksContainerView.addSubview(valueStackView)
        stacksContainerView.addSubview(toStackView)
        stacksContainerView.addSubview(bankStackView)
        stacksContainerView.addSubview(dateStackView)
        stacksContainerView.addSubview(authStackView)
        stacksContainerView.addSubview(containerStackView)
        addSubview(stacksContainerView)
        addSubview(shareButton)
    }

    func setupConstraints() {
        titleLabel
            .anchorVertical(top: safeAreaLayoutGuide.topAnchor, topConstant: 5)
            .anchorHorizontal(left: leftAnchor, leftConstant: 10)

        lineView
            .anchorHorizontal(left: leftAnchor, right: rightAnchor, leftConstant: 10, rightConstant: 10)
            .anchorVertical(top: titleLabel.bottomAnchor, topConstant: 10)
            .anchorSize(heightConstant: 1)

        stacksContainerView
            .anchorHorizontal(left: leftAnchor, right: rightAnchor)
            .anchorVertical(top: lineView.bottomAnchor, bottom: shareButton.topAnchor)

        shareButton
            .anchorHorizontal(left: leftAnchor, right: rightAnchor, leftConstant: 10, rightConstant: 10)
            .anchorVertical(bottom: safeAreaLayoutGuide.bottomAnchor)
            .anchorSize(heightConstant: 50)

        setupStackViewConstraints()
    }

    func setupStackViewConstraints() {
        containerStackView
            .anchorVertical(top: stacksContainerView.topAnchor, topConstant: 20)
            .anchorHorizontal(left: stacksContainerView.leftAnchor,
                              right: stacksContainerView.rightAnchor,
                              leftConstant: 10)

    }

    func setupAdditionalConfiguration() {
        shareButton.addTarget(self, action: #selector(handleShareTapped), for: .touchUpInside)
        setupStackViews()
    }

    func setupStackViews() {
        addSubview(transactionTypeLocalized)
        addSubview(transactionTypeLabel)
        addSubview(valueLocalized)
        addSubview(valueLabel)
        addSubview(toLocalized)
        addSubview(toLabel)
        addSubview(bankLocalized)
        addSubview(bankLabel)
        addSubview(dateLocalized)
        addSubview(dateLabel)
        addSubview(authLocalized)
        addSubview(authLabel)
        transactionTypeStackView.addArrangedSubview(transactionTypeLocalized)
        transactionTypeStackView.addArrangedSubview(transactionTypeLabel)
        valueStackView.addArrangedSubview(valueLocalized)
        valueStackView.addArrangedSubview(valueLabel)
        toStackView.addArrangedSubview(toLocalized)
        toStackView.addArrangedSubview(toLabel)
        bankStackView.addArrangedSubview(bankLocalized)
        bankStackView.addArrangedSubview(bankLabel)
        dateStackView.addArrangedSubview(dateLocalized)
        dateStackView.addArrangedSubview(dateLabel)
        authStackView.addArrangedSubview(authLocalized)
        authStackView.addArrangedSubview(authLabel)
        containerStackView.addArrangedSubview(transactionTypeStackView)
        containerStackView.addArrangedSubview(valueStackView)
        containerStackView.addArrangedSubview(toStackView)
        containerStackView.addArrangedSubview(bankStackView)
        containerStackView.addArrangedSubview(dateStackView)
        containerStackView.addArrangedSubview(authStackView)
    }
}
