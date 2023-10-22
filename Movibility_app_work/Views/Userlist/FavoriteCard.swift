//
//  FavoriteCard.swift
//  Movibility_app
//
//  Created by shomokh aldosari on 30/03/1445 AH.
//

import SwiftUI

struct FavoriteCard: View {
    let movie: Movie
    @ObservedObject var imageLoader = ImageLoader()
    var body: some View {
        ZStack{
        if self.imageLoader.image != nil {
           
                Image(uiImage: self.imageLoader.image!)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(8)
                    .shadow(radius: 4)
               
            
        } else {
            VStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .cornerRadius(8)
                    .shadow(radius: 4)
                
                Text(movie.title)
                    .multilineTextAlignment(.center)
            }
        }
    }
        //.frame(width: 80, height: 80)
        .onAppear {
            self.imageLoader.loadImage(with: self.movie.posterURL)
        }
    }
}

#Preview {
    FavoriteCard(movie: Movie.stubbedMovie)
}
