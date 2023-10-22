//
//  MovieBackdropCarouselView.swift
//  Movibility_app
//
//  Created by Afrah Saleh on 27/03/1445 AH.
//

import SwiftUI

struct MovieBackdropCarouselView: View {
    let title: String
      let movies: [Movie]
    @ObservedObject private var movieListState = MovieListState()
      var body: some View {
        /*  VStack(alignment: .leading, spacing: 0) {
              Text(title)
                  .font(.title)
                  .fontWeight(.bold)
                  .padding(.horizontal)
              */
              ScrollView(.horizontal, showsIndicators: false) {
                  HStack(alignment: .top, spacing: 16) {
                      ForEach(self.movies) { movie in
                          VStack{
                              NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
                                  
                                  MovieBackdropCard(movie: movie)
                                      .frame(width: 272, height: 200)
                                  
                              }
                              
                              .buttonStyle(PlainButtonStyle())
                              .padding(.leading, movie.id == self.movies.first!.id ? 16 : 0)
                             // MovieDetailView4(movieId: movie.id)
                                  .padding(.trailing, movie.id == self.movies.last!.id ? 16 : 0)
                              
                            //  MovieDetailView4(movieId: movie.id).padding(.trailing)

                          }
                      }
                      
                  }
              }
          }
      }
  

#Preview {
    MovieBackdropCarouselView(title: "", movies: Movie.stubbedMovies)
}
