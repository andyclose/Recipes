//
//  MainView.swift
//  Recipes
//
//

import SwiftUI

struct MainView: View {
    @State private var recipes: [Recipe] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "books.vertical")
                    .imageScale(.large)

                List {
                    ForEach(recipes) { recipe in
                        recipeCell(recipe: recipe)
                    }
                }
                .task {
                    await loadRecipes()
                }
                .scrollContentBackground(.hidden)
            }
            .navigationTitle("Recipes")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func recipeCell(recipe: Recipe) -> some View {
        HStack(alignment: .top) {
            Text(recipe.name)
                .font(.title2)
            Spacer()
            if
                (recipe.photoUrlSmall?.isEmpty != nil),
                let photoString = recipe.photoUrlSmall,
                let photoUrl = URL(string: photoString) {
                    AsyncImage(url: photoUrl) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Image(systemName: "books.vertical")
                            .imageScale(.large)
                    }
                    .frame(width: 100)
            } else {
                Image(systemName: "books.vertical")
                    .imageScale(.large)
            }
        }
    }
    
    private func loadRecipes() async {
        do {
            recipes = try await Fetcher.getRecipes(with: URLConstants.recipeURL)
        } catch let error {
            print("Error: \(error.localizedDescription)")
        }
    }
}

#Preview {
    MainView()
}
