//
//  MovieDetailView4.swift
//  Movibility_app
//
//  Created by Afrah Saleh on 27/03/1445 AH.
//

import SwiftUI

struct MovieDetailView4: View {
    let movieId: Int
    @ObservedObject private var movieDetailState = MovieDetailState()
    
    var body: some View {
        VStack{
            if let movie = movieDetailState.movie{
                Text(movie.genreText)
                  
                    .foregroundColor(.green)
               // Text("·")
            
        }
    }.onAppear {
                
        self.movieDetailState.loadMovie(id: movieId)
                
            }
    }
}
