//
//  NameView.swift
//  Food Order UI
//
//  Created by Emincan Antalyalı on 20.10.2023.
//

import UIKit

final class NameView: UIView {

    var name: String? {
        didSet {
            nameLabel.text = name
        }
    }
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.textColor = .darkGray
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: topAnchor),
            bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor)
        ])
    }
}
