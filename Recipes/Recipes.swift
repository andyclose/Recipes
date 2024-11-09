//
//  Recipes.swift
//  Recipes
//
//

import Foundation

// MARK: Recipe

struct Recipe: Decodable, Identifiable {
    // Required
    let cuisine: String
    let name: String
    let uuid: String

    // Optional
    let photoUrlLarge: String?
    let photoUrlSmall: String?
    let sourceUrl: String?
    let youtubeUrl: String?
}

extension Recipe {
    var id: String { uuid }
}

// MARK: Recipes

struct Recipes: Decodable {
    let recipes: [Recipe]?
}
