//
//  StatementTableViewCell.swift
//  DesafioSupremo
//
//  Created by Fernando Crelick on 11/07/22.
//

import UIKit

class StatementTableViewCell: UITableViewCell {
    //MARK: - Properties
    var item: Item? {
        didSet { configure() }
    }

    private let infoLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 19)
        label.textColor = ColorPalette.black

        return label
    }()

    private let nameToLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = ColorPalette.grey

        return label
    }()

    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = ColorPalette.black

        return label
    }()

    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = ColorPalette.grey
        label.textAlignment = .center

        return label
    }()

    private let infoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally

        return stackView
    }()

    private let cellStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing

        return stackView
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorPalette.black

        return view
    }()

    private let dotView: UIView = {
        let view = DotView()
        view.backgroundColor = ColorPalette.cyan

        return view
    }()

    private let pixView: UIView = {
        let view = UIView()
        view.backgroundColor = ColorPalette.cyan

        return view
    }()

    private let pixLabel: UILabel = {
        let label = UILabel()
        label.textColor = ColorPalette.white
        label.font = .boldSystemFont(ofSize: 9)
        label.text = LocaleKeys.pixLabel.localized

        return label
    }()

    //MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - helpers
    private func configure() {
        guard let item = item else {
            return
        }
        let viewModel = StatementCellViewModel(item: item)
        infoLabel.text = viewModel.infoLabelText
        nameToLabel.text = viewModel.nameToLabelText
        valueLabel.text = viewModel.amountLabelText
        dateLabel.text = viewModel.dateLabel
        pixView.isHidden = !viewModel.isPix
    }
}

extension StatementTableViewCell: ViewCoding {
    func buildViewHierarchy() {
        SetupStackViews()
        addSubview(lineView)
        lineView.addSubview(dotView)
        addSubview(cellStackView)
        addSubview(pixView)
        pixView.addSubview(pixLabel)
    }

    func setupConstraints() {
        lineView
            .anchorHorizontal(left: leftAnchor, leftConstant: 20)
            .anchorVertical(top: topAnchor, bottom: bottomAnchor)
            .anchorSize(widthConstant: 1)

        dotView
            .anchorCenterY(to: lineView)
            .anchorCenterX(to: lineView)
            .anchorSize(widthConstant: 10, heightConstant: 10)

        cellStackView
            .anchorHorizontal(left: lineView.rightAnchor, right: rightAnchor, leftConstant: 20, rightConstant: 15)
            .anchorVertical(top: topAnchor, bottom: bottomAnchor, topConstant: 10, bottomConstant: 10)

        pixView
            .anchorCenterX(to: dateLabel)
            .anchorCenterY(to: infoLabel)
            .anchorSize(widthConstant: 50, heightConstant: 19)

        pixLabel
            .anchorCenterY(to: pixView)
            .anchorCenterX(to: pixView)
    }

    func setupAdditionalConfiguration() {
        backgroundColor = ColorPalette.white
    }

    func SetupStackViews() {
        infoStackView.addArrangedSubview(infoLabel)
        infoStackView.addArrangedSubview(nameToLabel)
        infoStackView.addArrangedSubview(valueLabel)
        cellStackView.addArrangedSubview(infoStackView)
        cellStackView.addArrangedSubview(dateLabel)
    }
}
