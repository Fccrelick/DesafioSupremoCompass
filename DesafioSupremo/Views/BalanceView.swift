//
//  StatementView.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 11/07/22.
//

import UIKit

final class BalanceView: UIView {
    //MARK: Properties
    var balance: String? {
        get{ return balanceLabel.text }
        set{ balanceLabel.text = newValue}
    }

    var eyeButtonSelected = false

    private let balanceLocalizedLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.text = LocaleKeys.balanceLocalizedLabel.localized

        return label
    }()

    private let eyeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "eyeIcon-show"), for: .normal)
        button.tintColor = ColorPalette.cyan

        return button
    }()
    
    private let localizedStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 7

        return stackView
    }()

    private let balanceLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 22)
        label.textColor = ColorPalette.cyan

        return label
    }()

    private let headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .leading

        return stackView
    }()

    private let yourTransactionsLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.text = LocaleKeys.yourTransactionsLabel.localized

        return label
    }()

    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorPalette.lightGrey

        return view
    }()

    private lazy var lineView: LineView = {
        let view = LineView()
        view.backgroundColor = ColorPalette.lightGrey
        view.isHidden = true

        return view
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
    func handleEyeButtonTapped() {
        if eyeButtonSelected {
            headerStackView.removeArrangedSubview(lineView)
            headerStackView.addArrangedSubview(balanceLabel)
            eyeButton.setImage(UIImage(named: "eyeIcon-show"), for: .normal)
            lineView.isHidden.toggle()
            eyeButtonSelected.toggle()
        } else {
            headerStackView.removeArrangedSubview(balanceLabel)
            headerStackView.addArrangedSubview(lineView)
            eyeButton.setImage(UIImage(named: "eyeIcon-hide"), for: .normal)
            lineView.isHidden.toggle()
            eyeButtonSelected.toggle()
        }
    }
}

// MARK: - View Coding

extension BalanceView: ViewCoding {
    func buildViewHierarchy() {
        setupStackView()
        addSubview(containerView)
        addSubview(yourTransactionsLabel)
        addSubview(lineView)
        containerView.addSubview(headerStackView)
    }

    func setupConstraints() {
        yourTransactionsLabel
            .anchorHorizontal(left: leftAnchor, leftConstant: 17)
            .anchorVertical(bottom: bottomAnchor, bottomConstant: 25)

        lineView
            .anchorHorizontal(left: balanceLabel.leftAnchor, right: balanceLabel.rightAnchor)
            .anchorVertical(top: balanceLabel.topAnchor, bottom: balanceLabel.bottomAnchor)

        headerStackView
            .anchorCenterY(to: containerView)
            .anchorHorizontal(left: containerView.leftAnchor, leftConstant: 17)

        containerView
            .anchorHorizontal(left: leftAnchor, right: rightAnchor)
            .anchorVertical(top: topAnchor, bottom: yourTransactionsLabel.topAnchor, bottomConstant: 20)

        eyeButton
            .anchorSize(widthConstant: 20, heightConstant: 15)
    }

    func setupAdditionalConfiguration() {
        backgroundColor = ColorPalette.white
        eyeButton.addTarget(self, action: #selector(handleEyeButtonTapped), for: .touchUpInside)
    }

    func setupStackView() {
        localizedStackView.addArrangedSubview(balanceLocalizedLabel)
        localizedStackView.addArrangedSubview(eyeButton)
        headerStackView.addArrangedSubview(localizedStackView)
        headerStackView.addArrangedSubview(balanceLabel)
    }
}
