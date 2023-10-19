//
//  ViewController.swift
//  Food Order UI
//
//  Created by Emincan Antalyalı on 18.10.2023.
//

import UIKit

final class MainPageViewController: UIViewController {

    //MARK: - Varaibles

    private let sections = MockData.shared.pageData

    //MARK: - Components

    private let mainPageHeader: MainPageHeader = {
        let mainPageHeader = MainPageHeader()
        mainPageHeader.translatesAutoresizingMaskIntoConstraints = false
        return mainPageHeader
    }()

    private let mainCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.layer.cornerRadius = 5
        collection.backgroundColor = .clear
        collection.showsVerticalScrollIndicator = false
        collection.register(MainVerticalCollectionView.self, forCellWithReuseIdentifier: MainVerticalCollectionView.identifier)
        collection.register(CategoriesCollectionViewCell.self, forCellWithReuseIdentifier: CategoriesCollectionViewCell.identifier)
        collection.register(HorizontalCollectionViewCell.self, forCellWithReuseIdentifier: HorizontalCollectionViewCell.identifier)
        collection.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.identifier)
        return collection
    }()

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

private extension MainPageViewController {
    func setup() {
        view.backgroundColor = .white
        view.addSubview(mainCollectionView)
        view.addSubview(mainPageHeader)
        mainCollectionView.dataSource = self
        mainCollectionView.delegate = self
        mainCollectionView.collectionViewLayout = createLayout()

        NSLayoutConstraint.activate([
            mainPageHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            mainPageHeader.topAnchor.constraint(equalTo: view.topAnchor,constant: 16),
            view.trailingAnchor.constraint(equalTo: mainPageHeader.trailingAnchor,constant: 16),
            mainPageHeader.heightAnchor.constraint(equalToConstant: view.frame.height / 10)
        ])
        NSLayoutConstraint.activate([
            mainCollectionView.topAnchor.constraint(equalTo: mainPageHeader.bottomAnchor),
            mainCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: mainCollectionView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: mainCollectionView.bottomAnchor)
        ])
    }
}

extension MainPageViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch sections[indexPath.section] {
            case .categories(let items):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCollectionViewCell.identifier, for: indexPath) as? CategoriesCollectionViewCell else { return UICollectionViewCell() }
                cell.item = items[indexPath.row]
                return cell
            case .popularRestaurants(let items):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainVerticalCollectionView.identifier, for: indexPath) as? MainVerticalCollectionView else { return UICollectionViewCell() }
                cell.item = items[indexPath.row]
                return cell
            case .mostPopular(let items):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalCollectionViewCell.identifier, for: indexPath) as? HorizontalCollectionViewCell else { return UICollectionViewCell() }
                cell.item = items[indexPath.row]
                return cell
            case .recentRestaurants(let items):
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainVerticalCollectionView.identifier, for: indexPath) as? MainVerticalCollectionView else { return UICollectionViewCell() }
                cell.item = items[indexPath.row]
                return cell
        }
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return  sections.count
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.identifier, for: indexPath) as? SectionHeader else {return UICollectionReusableView()}

        header.configure(text: sections[indexPath.section].title)
        return header
    }
}
// MARK: - UICollectionViewDelegate
extension MainPageViewController: UICollectionViewDelegate {}

// MARK: - UICollectionViewCompositionalLayout
private extension MainPageViewController {

    func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { sectionIndex,_ in
            let section = self.sections[sectionIndex]
            switch section {
                case .categories:
                    return self.makeHLayout(isSmall: true)
                case .popularRestaurants:
                    return self.makeVLayout()
                case .mostPopular:
                    return self.makeHLayout(isSmall: false)
                case .recentRestaurants:
                    return self.makeVLayout()
            }
        }
    }

    func makeVLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.5))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 12, leading: 4, bottom: 12, trailing: 4)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .fractionalWidth(0.5))

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .absolute(50.0))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: footerHeaderSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: 32, leading: 0, bottom: 32, trailing: 0)
        section.boundarySupplementaryItems = [header]
        return section
    }

    func makeHLayout(isSmall: Bool) -> NSCollectionLayoutSection {
        let size = isSmall ? 0.3 : 0.6
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalWidth(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = .init(top: 5, leading: 5, bottom: 5, trailing: 5)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(size),
                                               heightDimension: .estimated(70))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)

        let footerHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                      heightDimension: .absolute(50.0))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: footerHeaderSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)

        section.boundarySupplementaryItems = [header]
        section.contentInsets = .init(top: 16, leading: 12, bottom: 16, trailing: 12)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
}


