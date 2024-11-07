//
//  RecipesTests.swift
//  RecipesTests
//
//

import Testing
@testable import Recipes

struct RecipesTests {

    @Test func fetchEmptyRecipes() async throws {
        let recipes = try await Fetcher.getRecipes(with: URLConstants.emptyURL)
        
        #expect(recipes.isEmpty)
    }

    @Test func fetchMalformedRecipes() async throws {
        let recipes = try await Fetcher.getRecipes(with: URLConstants.malformedURL)
        
        #expect(recipes.isEmpty)
    }

    @Test func fetchValidRecipes() async throws {
        let recipes = try await Fetcher.getRecipes(with: URLConstants.recipeURL)
        
        #expect(!recipes.isEmpty)
    }

}
