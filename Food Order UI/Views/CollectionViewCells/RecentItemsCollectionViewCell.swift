//
//  RecentItemsCollectionViewCell.swift
//  Food Order UI
//
//  Created by Emincan Antalyalı on 19.10.2023.
//

import UIKit

final class RecentItemsCollectionViewCell: UICollectionViewCell {

    static let identifier = "RecentItemsCollectionViewCell"

    //MARK: - Varibles
    var item: ListItem? {
        didSet {
            nameLabel.text = item?.title
            nameLabel.layer.cornerRadius = 20
            imageView.image = item?.image
            categoryLabel.text = "Western"
            ratingView.ratingScore = "4.0"
            ratingView.totalRates =  "(129 ratings)"
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
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15, weight: .medium)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.textColor = .lightGray
        return label
    }()
    
    private let ratingView: RatingView = {
        let ratingView = RatingView()
        ratingView.translatesAutoresizingMaskIntoConstraints = false
        return ratingView
    }()

    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = .checkmark
        iv.contentMode = .scaleAspectFit
        iv.tintColor = .label
        return iv
    }()
    private let dummyView: UIView = {
        let iv = UIView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    private let dummyView2: UIView = {
        let iv = UIView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    private let verticalStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.distribution = .fillEqually
        stackview.axis = .vertical
        stackview.alignment = .leading
        return stackview
    }()

    //MARK: - Init funcs
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConts()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        item = nil
    }
    //MARK: SetConts
    private func setConts(){
        contentView.addSubview(dummyView)
        contentView.addSubview(dummyView2)
        contentView.addSubview(verticalStackView)
        contentView.addSubview(imageView)
        verticalStackView.addArrangedSubview(nameLabel)
        verticalStackView.addArrangedSubview(categoryLabel)
        verticalStackView.addArrangedSubview(ratingView)

        NSLayoutConstraint.activate([
            dummyView.topAnchor.constraint(equalTo: contentView.topAnchor),
            dummyView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            dummyView.widthAnchor.constraint(equalToConstant: contentView.frame.width / 3 ),
            contentView.bottomAnchor.constraint(equalTo: dummyView.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            dummyView2.topAnchor.constraint(equalTo: topAnchor),
            dummyView2.leadingAnchor.constraint(equalTo: dummyView.trailingAnchor,constant: 16),
            trailingAnchor.constraint(equalTo: dummyView2.trailingAnchor),
            bottomAnchor.constraint(equalTo: dummyView2.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: dummyView.leadingAnchor, constant: 4),
            imageView.trailingAnchor.constraint(equalTo: dummyView.trailingAnchor, constant: 4),
            imageView.topAnchor.constraint(equalTo: dummyView.topAnchor, constant: 4),
            imageView.bottomAnchor.constraint(equalTo: dummyView.bottomAnchor, constant: 4)
        ])
        NSLayoutConstraint.activate([
            verticalStackView.leadingAnchor.constraint(equalTo: dummyView2.leadingAnchor),
            verticalStackView.trailingAnchor.constraint(equalTo: dummyView2.trailingAnchor),
            verticalStackView.topAnchor.constraint(equalTo: dummyView2.topAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: dummyView2.bottomAnchor,constant: -32)
        ])
    }
}
