//
//  CategoriesCollectionViewCell.swift
//  Food Order UI
//
//  Created by Emincan Antalyalı on 18.10.2023.
//
import UIKit

final class CategoriesCollectionViewCell: UICollectionViewCell {

    static let identifier = "CategoriesCollectionViewCell"

    var item: ListItem? {
        didSet {
            label.text = item?.title
            imageView.image = item?.image
        }
    }
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.textColor = .black
        return label
    }()
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFit
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

    private func setConts() {
        contentView.backgroundColor = .clear
        label.layer.cornerRadius = 20
        contentView.addSubview(dummyView)
        contentView.addSubview(dummyView2)
        contentView.addSubview(imageView)
        contentView.addSubview(label)

        NSLayoutConstraint.activate([
            dummyView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 8),
            dummyView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 8),
            contentView.trailingAnchor.constraint(equalTo: dummyView.trailingAnchor,constant: 8),
            contentView.bottomAnchor.constraint(equalTo: dummyView.bottomAnchor,constant: 20)
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
            label.leadingAnchor.constraint(equalTo: dummyView2.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: dummyView2.trailingAnchor),
            label.topAnchor.constraint(equalTo: dummyView2.topAnchor),
            label.bottomAnchor.constraint(equalTo: dummyView2.bottomAnchor)
        ])
    }
}
