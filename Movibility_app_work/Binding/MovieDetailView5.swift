//
//  MovieDetailView5.swift
//  Movibility_app
//
//  Created by Afrah Saleh on 27/03/1445 AH.
//

import SwiftUI

struct MovieDetailView5: View {
    let movieId: Int
    @ObservedObject private var movieDetailState = MovieDetailState()
    
    var body: some View {
        VStack(alignment: .leading) {
            if let movie = movieDetailState.movie{
                Text(movie.title)
                    .font(.system(size: 15, weight: .heavy, design: .rounded))
                Text(movie.genreText)
                    .font(.system(size: 8, weight:  .heavy, design: .rounded))
                Text("⭐️ "+movie.scoreText)
                    .foregroundColor(.yellow)
                    .font(.system(size: 8, weight:  .heavy, design: .rounded))
                 //   .foregroundColor(.green)
               // Text("·")
            
        }
            
    } .padding()
        .onAppear {
                
        self.movieDetailState.loadMovie(id: movieId)
                
            }
    }
}
