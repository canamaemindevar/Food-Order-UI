//
//  CategoryView.swift
//  Food Order UI
//
//  Created by Emincan Antalyalı on 20.10.2023.
//

import UIKit

final class CategoryView: UIView {

    var categoryName: String? {
        didSet {
            categoryLabel.text = categoryName
        }
    }

    private var categoryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.textColor = .lightGray
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
        addSubview(categoryLabel)

        NSLayoutConstraint.activate([
            categoryLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            categoryLabel.topAnchor.constraint(equalTo: topAnchor),
            bottomAnchor.constraint(equalTo: categoryLabel.bottomAnchor),
            trailingAnchor.constraint(equalTo: categoryLabel.trailingAnchor)
        ])
    }
}
