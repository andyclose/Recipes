//
//  DataCoordinator.swift
//  Recipes
//
//

import Foundation

struct DataCoordinator {
    static func getRecipes(with urlString: String) async throws -> [Recipe] {
        guard let url = URL(string: urlString) else {
            // Force crash ...
            fatalError("This should only ever happen during development due to dev error...")
        }
        
        do {
            guard let data = try await DataFetcher.getRecipeData(with: url) else {
                return []
            }

            return decode(data: data)
        } catch let error {
            print("\(error.localizedDescription)")
            // TODO: Error handling for connectivity or service errors
            // Log error
        }
        
        return []
    }
    
    private static func decode(data: Data) -> [Recipe] {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(Recipes.self, from: data)
            
            return decodedData.recipes ?? []
        } catch let error as DecodingError {
            print("\(error.localizedDescription)")
            // If a recipe is malformed, your app should disregard the entire list of recipes and handle the error gracefully.
            // Log error
        } catch let error {
            print("\(error.localizedDescription)")
            // TODO: Error handling for connectivity or service errors
            // Log error
        }
        
        return []
    }
}
