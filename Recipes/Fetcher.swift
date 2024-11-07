//
//  Fetcher.swift
//  Recipes
//
//

import Foundation

struct Fetcher {
    
    static func getRecipes(with urlString: String) async throws -> [Recipe] {
        guard let url = URL(string: urlString) else {
            // TODO: throw something here...
            return []
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedData = try JSONDecoder().decode(Recipes.self, from: data)
            
            return decodedData.recipes ?? []
        } catch let error as DecodingError {
            // If a recipe is malformed, your app should disregard the entire list of recipes and handle the error gracefully.
            // TODO: possibly return some error state for an alert?
        } catch let error {
            print("\(error.localizedDescription)")
            // TODO: throw something here...
        }
        
        return []
    }
}
