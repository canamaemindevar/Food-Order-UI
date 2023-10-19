//
//  HorizontalCollectionViewCell.swift
//  Food Order UI
//
//  Created by Emincan Antalyalı on 18.10.2023.
//

import UIKit

final class MostPopularCollectionViewCell: UICollectionViewCell {
    static let identifier = "MostPopularCollectionViewCell"

    //MARK: - Varibles
    var item: ListItem? {
        didSet {
            nameLabel.name = item?.title
            nameLabel.layer.cornerRadius = 20
            imageView.image = item?.image
            categoryView.categoryName = "Western"
            ratingView.ratingScore = "4.9"
            typeView.categoryName = "Cafe"
        }
    }

    private let nameLabel: NameView = {
        let label = NameView()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let categoryView: CategoryView = {
        let categoryView = CategoryView()
        categoryView.translatesAutoresizingMaskIntoConstraints = false
        return categoryView
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
    private let typeView: RestaurantTypeView = {
        let typeView = RestaurantTypeView()
        typeView.translatesAutoresizingMaskIntoConstraints = false
        return typeView
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
        stackview.spacing = 12
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
        horizantalStackView.addArrangedSubview(typeView)
        horizantalStackView.addArrangedSubview(categoryView)
        horizantalStackView.addArrangedSubview(ratingView)

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
            verticalStackView.leadingAnchor.constraint(equalTo: dummyView2.leadingAnchor,constant: 4),
            verticalStackView.trailingAnchor.constraint(equalTo: dummyView2.trailingAnchor,constant: 4),
            verticalStackView.topAnchor.constraint(equalTo: dummyView2.topAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: dummyView2.bottomAnchor)
        ])
    }
}
