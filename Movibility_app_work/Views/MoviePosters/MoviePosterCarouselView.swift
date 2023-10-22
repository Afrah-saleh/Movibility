//
//  MoviePosterCarouselView.swift
//  Movibility_app
//
//  Created by Afrah Saleh on 27/03/1445 AH.
//

import Foundation
import SwiftUI

struct MoviePosterCarouselView: View {
    let title: String
       let movies: [Movie]
       
    var body: some View {
    
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(alignment: .top, spacing: 3) {
                        ForEach(self.movies) { movie in
                             NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
                            MoviePosterCard(movie: movie)
                                .padding(.horizontal)
                        }.scrollContentBackground(.hidden)
                            
                            .buttonStyle(PlainButtonStyle())
                 
                    }
               }
        }
    }
}

#Preview {
    MoviePosterCarouselView(title: "", movies: Movie.stubbedMovies)
}
