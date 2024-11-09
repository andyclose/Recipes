//
//  MainView.swift
//  Recipes
//
//

import SwiftUI
import WebKit

struct MainView: View {
    @State private var viewModel: MainViewModel = MainViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                MainViewModel.Constants.placeholderImage
                
                List {
                    if viewModel.recipes.isEmpty {
                        displayNoRecipes()
                    } else {
                        buildCells()
                    }
                }
                .refreshable(action: { await viewModel.loadRecipes() })
                .scrollContentBackground(.hidden)
            }
            .navigationTitle(MainViewModel.Constants.title)
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await viewModel.loadRecipes()
            }
        }
    }
    
    // MARK: Functions
    
    private func buildCells() -> some View {
        ForEach(viewModel.cuisines, id: \.self) { cuisine in
            Section(content: {
                ForEach(viewModel.recipes) { recipe in
                    if recipe.cuisine == cuisine {
                        recipeCell(recipe: recipe)
                    }
                }
            },
                    header: { Text(cuisine) },
                    footer: {}
            )
        }
    }
    
    private func displayNoRecipes() -> some View {
        HStack {
            Spacer()
            VStack {
                Text(MainViewModel.Constants.emptyListTitle)
                    .font(.title2)
                Text(MainViewModel.Constants.emptyListIcon)
                    .font(.largeTitle)
                Text(MainViewModel.Constants.emptyListSubTitle)
            }
            .frame(height: 500)
            Spacer()
        }
    }
    
    private func recipeCell(recipe: Recipe) -> some View {
        HStack(alignment: .top) {
            Text(recipe.name)
                .font(.title2)
            Spacer()
            fetchAndCacheImage(for: recipe)
                .frame(width: 75, height: 75)
        }
    }
    
    private func fetchAndCacheImage(for recipe: Recipe) -> some View {
        let placeholderImage = AnyView(MainViewModel.Constants.placeholderImage)
        
        if let imageIndex = viewModel.photos.index(forKey: recipe.id) {
            return viewModel.photos[imageIndex].value
        }
        
        guard
            let urlString = recipe.photoUrlSmall,
            let url = URL(string: urlString) else {
            return placeholderImage
        }
        
        let resizedImage = AnyView(AsyncImage(url: url) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else if phase.error != nil {
                placeholderImage
            } else {
                ProgressView()
            }
        })
        
        viewModel.photos[recipe.id] = resizedImage
        
        return resizedImage
    }
}

#Preview {
    MainView()
}
