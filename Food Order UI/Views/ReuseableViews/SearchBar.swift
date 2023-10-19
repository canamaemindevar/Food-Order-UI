//
//  SearchBar.swift
//  Food Order UI
//
//  Created by Emincan Antalyalı on 19.10.2023.
//

import UIKit

final class SearchBar: UIView {

    private let magnifyingglassView: UIImageView = {
        let iconLabel = UIImageView()
        iconLabel.translatesAutoresizingMaskIntoConstraints = false
        iconLabel.image = UIImage(systemName: "magnifyingglass")
        iconLabel.tintColor = .darkGray
        iconLabel.contentMode = .scaleAspectFit
        iconLabel.backgroundColor = .lightGray
        return iconLabel
    }()

    private let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .lightGray
        textField.attributedPlaceholder = NSAttributedString(
            string: "Search Food",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        return textField
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setup() {
        addSubview(magnifyingglassView)
        addSubview(textField)
        self.layer.cornerRadius = 20
        magnifyingglassView.layer.cornerRadius = 20
        textField.layer.cornerRadius = 20
        backgroundColor = .lightGray

        NSLayoutConstraint.activate([
            magnifyingglassView.topAnchor.constraint(equalTo: topAnchor),
            magnifyingglassView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 8),
            bottomAnchor.constraint(equalTo: magnifyingglassView.bottomAnchor),
            magnifyingglassView.widthAnchor.constraint(equalToConstant: 20)
        ])
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: topAnchor),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 28),
            trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            bottomAnchor.constraint(equalTo: textField.bottomAnchor)
        ])
    }
}
