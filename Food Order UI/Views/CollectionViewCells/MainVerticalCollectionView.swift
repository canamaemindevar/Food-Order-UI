//
//  MainVerticalCollectionView.swift
//  Food Order UI
//
//  Created by Emincan Antalyalı on 18.10.2023.
//

import UIKit

final class MainVerticalCollectionView: UICollectionViewCell {

    static let identifier = "MainVerticalCollectionView"

    //MARK: - Varibles
    var item: ListItem? {
        didSet {
            nameLabel.text = item?.title
            nameLabel.layer.cornerRadius = 20
            imageView.image = item?.image
            categoryLabel.text = "Western Food"
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
        label.font = .systemFont(ofSize: 12, weight: .medium)
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

    private let horizantalStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.distribution = .fillEqually
        stackview.axis = .horizontal
        stackview.alignment = .bottom
        stackview.spacing = 80
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
        verticalStackView.addArrangedSubview(horizantalStackView)
        horizantalStackView.addArrangedSubview(ratingView)
        horizantalStackView.addArrangedSubview(categoryLabel)

        NSLayoutConstraint.activate([
            dummyView.topAnchor.constraint(equalTo: contentView.topAnchor),
            dummyView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: dummyView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: dummyView.bottomAnchor,constant: 40)
        ])
        NSLayoutConstraint.activate([
            dummyView2.topAnchor.constraint(equalTo: dummyView.bottomAnchor),
            dummyView2.leadingAnchor.constraint(equalTo: dummyView.leadingAnchor),
            dummyView2.trailingAnchor.constraint(equalTo: dummyView.trailingAnchor),
            bottomAnchor.constraint(equalTo: dummyView2.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: dummyView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: dummyView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: dummyView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: dummyView.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            verticalStackView.leadingAnchor.constraint(equalTo: dummyView2.leadingAnchor,constant: 16),
            verticalStackView.trailingAnchor.constraint(equalTo: dummyView2.trailingAnchor,constant: 16),
            verticalStackView.topAnchor.constraint(equalTo: dummyView2.topAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: dummyView2.bottomAnchor)
        ])
    }
}
