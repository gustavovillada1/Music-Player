//
//  BottomTabItem.swift
//  SpotifyClone
//
//  Created by Gustavo Adolfo Villada Molina on 25/06/25.
//

import Foundation
import SwiftUI
import SwiftUIComponentsKit

enum BottomTabItem: BottomTabItemProtocol {
    case home, search, library, profile

    var label: String {
        switch self {
        case .home: "Home"
        case .search: "Search"
        case .library: "Your Library"
        case .profile: "Profile"
        }
    }

    var icon: String {
        switch self {
        case .home: "house.fill"
        case .search: "magnifyingglass"
        case .library: "books.vertical.fill"
        case .profile: "person.crop.circle.fill"
        }
    }

    var view: AnyView {
        switch self {
        case .home: AnyView(HomeWireframe.getHomeScreen())
        case .search: AnyView(Color.white)
        case .library: AnyView(Color.green)
        case .profile: AnyView(Color.yellow)
        }
    }
}
