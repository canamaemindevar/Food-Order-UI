//
//  MockData.swift
//  Food Order UI
//
//  Created by Emincan Antalyalı on 18.10.2023.
//

import Foundation

struct MockData {
    static let shared = MockData()

    private let categories: ListSection = {
        .categories([.init(title: "Offers", image: ImagePalette.pizza),
                     .init(title: "Italian", image: ImagePalette.hamburger),
                     .init(title: "Indian", image: ImagePalette.pizza),
                     .init(title: "Turkish", image: ImagePalette.hamburger),
                     .init(title: "Fast Food", image: ImagePalette.pizza),
                     .init(title: "French", image: ImagePalette.hamburger),
                     .init(title: "Asia", image: ImagePalette.pizza),
                     .init(title: "Africa", image: ImagePalette.hamburger)])
    }()

    private let popularRestaurants: ListSection = {
        .popularRestaurants([.init(title: "Minute by tuk tuk", image: ImagePalette.hamburger),
                             .init(title: "Cafe de Noir", image: ImagePalette.pizza),
                             .init(title: "Bakes by Tella", image: ImagePalette.pizza),
                             .init(title: "Pizza Hut", image: ImagePalette.hamburger),
                             .init(title: "Turkish Kebab", image: ImagePalette.pizza)])
    }()

    private let mostPopular: ListSection = {
        .mostPopular([.init(title: "Cafe De Bambaa", image: ImagePalette.pizza),
                      .init(title: "Burger by Burger King", image: ImagePalette.pizza),
                      .init(title: "Mc Donalds", image: ImagePalette.pizza),
                      .init(title: "Western Food", image: ImagePalette.hamburger),
                      .init(title: "Sushi by Japan", image: ImagePalette.pizza)])
    }()

    private let recent: ListSection = {
        .recentRestaurants([.init(title: "Mulberry Pizza by Josh", image: ImagePalette.hamburger),
                            .init(title: "Barita", image: ImagePalette.pizza),
                            .init(title: "Pizza Rush Hour", image: ImagePalette.hamburger),
                            .init(title: "Sweeden Meatball", image: ImagePalette.pizza),
                            .init(title: "Cheese House", image: ImagePalette.pizza)])
    }()

    var pageData: [ListSection] {
        [categories, popularRestaurants, mostPopular, recent]
    }
}
