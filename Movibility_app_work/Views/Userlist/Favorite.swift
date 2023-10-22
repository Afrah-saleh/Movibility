//
//  Favorite.swift
//  Movibility_app
//
//  Created by shomokh aldosari on 30/03/1445 AH.
//

import SwiftUI

struct Favorite: View {
    let title: String
    let movies: [Movie]
    @ObservedObject private var movieListState = MovieListState()
    let movie: Movie
    var body: some View {
        NavigationView {
            
        List{
            ForEach(self.movies) { movie in
                NavigationLink(destination: MovieDetailView(movieId: Movie.stubbedMovie.id)) {
                    FavoriteCard( movie: movie)
                    MovieDetailView3(movieId: movie.id)
                }
                
                .scrollContentBackground(.hidden)
                
                .buttonStyle(PlainButtonStyle())
            }
            .listRowBackground(CustomColor.darkBlue)
            .listRowSeparatorTint(CustomColor.lightblue)
            
        }
        .scrollContentBackground(.hidden)
        .background(CustomColor.darkBlue)
        
        .navigationBarTitle("Favorite", displayMode: .inline)
        .toolbarColorScheme(.dark, for: .navigationBar)
                .toolbarBackground(

                    // 1
                    Color.darkBlue,
                    // 2
                    for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)


                
    }

    }
}

#Preview {
    Favorite(title: "", movies: Movie.stubbedMovies, movie: Movie.stubbedMovie)
}
