//
//  MovieBackdropCard.swift
//  Movibility_app
//
//  Created by Afrah Saleh on 27/03/1445 AH.
//

import SwiftUI

struct MovieBackdropCard: View {
    let movie: Movie
       @ObservedObject var imageLoader = ImageLoader()
    @ObservedObject private var movieListState = MovieListState()

       var body: some View {
           
           VStack(alignment: .leading) {
               
               ZStack {
                   Rectangle()
                       .fill(Color.gray.opacity(0.3))
                   
                   if self.imageLoader.image != nil {
                       Image(uiImage: self.imageLoader.image!)
                       .resizable()
                   }
               }
               
               .aspectRatio(16/9, contentMode: .fit)
               .cornerRadius(8)
               .shadow(radius: 4)
              
              Text(movie.title)
               //    .foregroundColor(Color.lightblue)
                   // MovieDetailView4(movieId: movie.id)
           }
           
          // .lineLimit(1)
           .onAppear {
               self.imageLoader.loadImage(with: self.movie.backdropURL)
               
           }
           
       }
   }

#Preview {
    MovieBackdropCard(movie: Movie.stubbedMovie)
}

