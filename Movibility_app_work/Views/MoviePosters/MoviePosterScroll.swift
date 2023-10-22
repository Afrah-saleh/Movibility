//
//  MoviePosterScroll.swift
//  Movibility_app
//
//  Created by Afrah Saleh on 27/03/1445 AH.
//

import SwiftUI

struct MoviePosterScroll: View {
    let title: String
       let movies: [Movie]
       let columns: [GridItem] = Array(repeating: .init(.flexible(), spacing: 16), count: 2) // Two columns
       
       var body: some View {
           ScrollView(.vertical, showsIndicators: true) {
               LazyVGrid(columns: columns, spacing: 16) {
                   ForEach(self.movies) { movie in
                       NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
                           MoviePoster(movie: movie)
                               .padding()
                              // .background(Color.white)
                               .cornerRadius(10)
                              // .shadow(radius: 5)
                       }
                       .buttonStyle(PlainButtonStyle())
                   }
               }
               .padding(16) // Add padding around the grid
           }
       }
   }
                              
#Preview {
    MoviePosterScroll(title: "", movies: Movie.stubbedMovies)
}
