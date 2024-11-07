//
//  Recipes.swift
//  Recipes
//
//

import Foundation

struct Recipe: Decodable, Identifiable {
    // Required
    let cuisine: String
    let id: String
    let name: String

    // Optional
    let photoUrlLarge: String?
    let photoUrlSmall: String?
    let sourceUrl: String?
    let youtubeUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case cuisine
        case name
        case id = "uuid"
        
        case photoUrlLarge = "photo_url_large"
        case photoUrlSmall = "photo_url_small"
        case sourceUrl = "source_url"
        case youtubeUrl = "youtube_url"
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cuisine = try container.decode(String.self, forKey: .cuisine)
        self.id = try container.decode(String.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.photoUrlLarge = try container.decodeIfPresent(String.self, forKey: .photoUrlLarge)
        self.photoUrlSmall = try container.decodeIfPresent(String.self, forKey: .photoUrlSmall)
        self.sourceUrl = try container.decodeIfPresent(String.self, forKey: .sourceUrl)
        self.youtubeUrl = try container.decodeIfPresent(String.self, forKey: .youtubeUrl)
    }
}

struct Recipes: Decodable {
    let recipes: [Recipe]?
    
    enum CodingKeys: String, CodingKey {
        case recipes
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.recipes = try container.decodeIfPresent([Recipe].self, forKey: .recipes)
    }
}
