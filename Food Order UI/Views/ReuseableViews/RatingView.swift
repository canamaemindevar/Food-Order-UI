//
//  RatingView.swift
//  Food Order UI
//
//  Created by Emincan Antalyalı on 19.10.2023.
//

import UIKit

final class RatingView: UIView {

    var ratingScore: String? {
        didSet {
            ratingLabel.text = "4.0"
        }
    }
    var totalRates: String? {
        didSet {
            totalRatingCount.text = "(129 rating)"
        }
    }

    private let starImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(systemName: "star.fill")
        iv.contentMode = .scaleAspectFit
        iv.tintColor = .systemOrange
        iv.sizeToFit()
        return iv
    }()

    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.textColor = .systemOrange
        label.sizeToFit()
        return label
    }()
    private let totalRatingCount: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.textColor = .lightGray
        label.sizeToFit()
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setup() {
        addSubview(starImageView)
        addSubview(ratingLabel)
        addSubview(totalRatingCount)

        NSLayoutConstraint.activate([
            starImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            starImageView.topAnchor.constraint(equalTo: topAnchor),
            starImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])

        NSLayoutConstraint.activate([
            ratingLabel.leadingAnchor.constraint(equalTo: starImageView.trailingAnchor, constant: 4),
            ratingLabel.centerYAnchor.constraint(equalTo: starImageView.centerYAnchor),
        ])
        NSLayoutConstraint.activate([
            totalRatingCount.leadingAnchor.constraint(equalTo: ratingLabel.trailingAnchor, constant: 4),
            totalRatingCount.centerYAnchor.constraint(equalTo: ratingLabel.centerYAnchor)
        ])
    }
}
