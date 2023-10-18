//
//  ListSection.swift
//  Food Order UI
//
//  Created by Emincan Antalyalı on 18.10.2023.
//

import Foundation

enum ListSection {
    case categories([ListItem])
    case popularRestaurants([ListItem])
    case mostPopular([ListItem])
    case recentRestaurants([ListItem])

    var items: [ListItem] {
        switch self {
            case .categories(let items),
                    .popularRestaurants(let items),
                    .mostPopular(let items),
                    .recentRestaurants(let items):
                return items
        }
    }

    var count: Int {
        return items.count
    }

    var title: String {
        switch self {
            case .categories:
                return "Categories"
            case .popularRestaurants:
                return "Popular Restaurants"
            case .mostPopular:
                return "Most Popular"
            case .recentRestaurants:
                return "Recent Restaurants"
        }
    }
}
