//
//  MovieDetailView2.swift
//  Movibility_app
//
//  Created by Afrah Saleh on 27/03/1445 AH.
//

import SwiftUI

struct MovieDetailView2: View {
    let movieId: Int
    @ObservedObject private var movieDetailState = MovieDetailState()
    
    var body: some View {
        VStack{
            if let movie = movieDetailState.movie{
            HStack {
                Text(movie.genreText)
                Text("·")
                Text(movie.yearText)
                Text("·")
                Text(movie.durationText)
            }
            
        }
    }.onAppear {
                
        self.movieDetailState.loadMovie(id: movieId)
                
            }
    }
}
