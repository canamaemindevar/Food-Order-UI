//
//  SectionHeaderCollectionView.swift
//  Food Order UI
//
//  Created by Emincan Antalyalı on 18.10.2023.
//

import UIKit

final class SectionHeader: UICollectionReusableView {

    static let identifier = "SectionHeader"

    private let label: UILabel = {
        let label: UILabel = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.sizeToFit()
        return label
    }()
    private let viewAllButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("View All", for: .normal)
        btn.setTitleColor(.systemOrange, for: .normal)
        return btn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    private func setup() {

        addSubview(label)
        addSubview(viewAllButton)

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 16),
            self.trailingAnchor.constraint(equalTo: label.trailingAnchor),
            self.bottomAnchor.constraint(equalTo: label.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            viewAllButton.topAnchor.constraint(equalTo: topAnchor),
            bottomAnchor.constraint(equalTo: viewAllButton.bottomAnchor),
            trailingAnchor.constraint(equalTo: viewAllButton.trailingAnchor,constant: 16),
            viewAllButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    func configure(text: String) {
        label.text = text
        self.layer.cornerRadius = 20
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
