//
//  MoviePoster.swift
//  Movibility_app
//
//  Created by Afrah Saleh on 27/03/1445 AH.
//

import SwiftUI

struct MoviePoster: View {
    let movie: Movie
    @ObservedObject var imageLoader = ImageLoader()
 @ObservedObject private var movieListState = MovieListState()
    var body: some View {
        
        ZStack {
            if self.imageLoader.image != nil {
                Image(uiImage: self.imageLoader.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(8)
                    .shadow(radius: 4)
                LinearGradient(
                                   gradient: Gradient(
                                       stops: [
                                           Gradient.Stop(color: Color.clear, location: 0),
                                           Gradient.Stop(color: Color.clear, location: 0.25),
                                           Gradient.Stop(color: Color.lightblue.opacity(0.3), location: 0.5),
                                           Gradient.Stop(color: Color.lightblue.opacity(0.6), location: 0.75),
                                           Gradient.Stop(color: Color.lightblue.opacity(1), location: 1)
                                       ]
                                   ),
                                   startPoint: .top,
                                   endPoint: .bottom
                               )
                               
                              // .cornerRadius(8)
                              // .shadow(radius: 4)
    
                MovieDetailView5(movieId: movie.id)
                    .foregroundColor(.white)
                   // .mask(Rectangle())
                   // .fixedSize()
                   // .border(.brown)
                   .offset(x:0, y:90)
                           
            }
            
            else {
                Rectangle()
                
                    //.fill(Color.gray.opacity(0.3))
                    .cornerRadius(8)
                    .shadow(radius: 4)
                
                Text(movie.title)
                    .multilineTextAlignment(.center)
                
               
            }
          
        }
        .frame(width: 180, height: 250)
        
        .onAppear {
            self.imageLoader.loadImage(with: self.movie.posterURL)
        }
        
    }
    
}

#Preview {
    MoviePoster(movie: Movie.stubbedMovie)
}
