//
//  DataFetcher.swift
//  Recipes
//
//

import Foundation

struct DataFetcher {
    static func getRecipeData(with url: URL) async throws -> Data? {
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            return data
        } catch let error {
            print("\(error.localizedDescription)")
            // TODO: Error handling for connectivity or service errors
            // Log error
        }
        
        return nil
    }
}
