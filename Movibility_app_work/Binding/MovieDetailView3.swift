//
//  MovieDetailView3.swift
//  Movibility_app
//
//  Created by shomokh aldosari on 30/03/1445 AH.
//

import Foundation
import SwiftUI

struct MovieDetailView3: View {
    let movieId: Int
    @ObservedObject private var movieDetailState = MovieDetailState()
    
    var body: some View {
        VStack{
            if let movie = movieDetailState.movie{
            VStack {
                Text(movie.title)
                    .bold()
                    .font(.system(size: 15))
                Text(movie.genreText)
                    .font(.system(size: 10))
                Text(movie.ratingText)
                    .foregroundColor(.yellow)
                    .font(.system(size: 10))
                Text(movie.scoreText)
                    .font(.system(size: 10))
            }
            
        }
        }.foregroundStyle(.white)
        .onAppear {
                
        self.movieDetailState.loadMovie(id: movieId)
                
            }
    }
}
