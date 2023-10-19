//
//  CategoryView.swift
//  Food Order UI
//
//  Created by Emincan Antalyalı on 20.10.2023.
//

import UIKit

final class RestaurantTypeView: UIView {

    var categoryName: String? {
        didSet{
            typeLabel.text = categoryName
        }
    }
    private let typeLabel: UILabel = {
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
        addSubview(typeLabel)
        NSLayoutConstraint.activate([
            typeLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            typeLabel.topAnchor.constraint(equalTo: topAnchor),
            bottomAnchor.constraint(equalTo: typeLabel.bottomAnchor),
            trailingAnchor.constraint(equalTo: typeLabel.trailingAnchor)
        ])
    }
}
