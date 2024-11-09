//
//  MainViewModel.swift
//  Recipes
//
//

import SwiftUI

@Observable
class MainViewModel {
    // MARK: Properties
    
    var cuisines: [String] {
        Array(Set(recipes.map { $0.cuisine} )).sorted()
    }
    
    var photos: [String: AnyView] = [:]
    var recipes: [Recipe] = []
    
    // MARK: Functions

    func loadRecipes() async {
        do {
            recipes = try await DataCoordinator.getRecipes(with: URLConstants.recipeURL)
        } catch let error {
            print("Error: \(error.localizedDescription)")
        }
    }

}

// MARK: Constants

extension MainViewModel {
    public enum Constants {
        static let emptyListTitle: String = "No Recipes"
        static let emptyListIcon: String = "☹️"
        static let emptyListSubTitle: String = "Pull to refresh"
        static let placeholderImage: Image = Image(systemName: "books.vertical")
        static let title: String = "Recipes"
    }
}
