//
//  MovieDetailView.swift
//  Movibility_app
//
//  Created by shomokh aldosari on 26/03/1445 AH.
//

import SwiftUI
struct CustomColor {
    static let darkBlue = Color("darkBlue")
    static let lightblue = Color("lightblue")
    
}
struct MovieDetailView: View {
    
    let movieId: Int
       @ObservedObject private var movieDetailState = MovieDetailState()
       
       var body: some View {
//           Color.darkBlue
//               .ignoresSafeArea()
           NavigationView{
               ZStack {
                   Rectangle().ignoresSafeArea()
                       .foregroundColor(CustomColor.darkBlue)
                   LoadingView(isLoading: self.movieDetailState.isLoading, error: self.movieDetailState.error) {
                       self.movieDetailState.loadMovie(id: self.movieId)
                   }
                   
                   if movieDetailState.movie != nil {
                       MovieDetailListView(movie: self.movieDetailState.movie!)
                       
                   }
               }
               
               .toolbarColorScheme(.dark, for: .navigationBar)
                       .toolbarBackground(

                           // 1
                           Color.darkBlue,
                           // 2
                           for: .navigationBar)
                       
           }
//           .navigationBarTitle(movieDetailState.movie?.title ?? "")
           .onAppear {
               self.movieDetailState.loadMovie(id: self.movieId)
           }
           
       }
        
   }
struct MovieDetailListView: View {
    @State private var isFilled = false
    let movie: Movie
    @State private var selectedTrailer: MovieVideo?
    let imageLoader = ImageLoader()
  
    var body: some View {
        ScrollView{
        VStack (alignment: .center, spacing: 6){
            
            MovieDetailImage(imageLoader: imageLoader, imageURL: self.movie.backdropURL)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            
            if movie.youtubeTrailers != nil && movie.youtubeTrailers!.count > 0 {
                
                //ForEach(movie.youtubeTrailers!)
                //{ trailer in

                Button(action: {
                        if let array = movie.youtubeTrailers{
                            self.selectedTrailer = array[0]
                        }
                    }) {
                        HStack {

                            Button(action: {
                                       self.isFilled.toggle()
                                   }) {
                                       Image(systemName: isFilled ? "star.fill" : "star")
                                           .foregroundColor(isFilled ? .lightblue : .lightblue)
                                   }
                                   
                                         
                                   .font(.title)
                                   
                            Image(systemName: "play.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(CustomColor.lightblue)
                                .padding(.horizontal, 148)
                                .offset(x:-25, y: 0)
                            
                        }
                    }
                //}
            }
            Text(movie.title)
                .bold()
                .font(.system(size: 30))
            
            Text(movie.genreText)
           // HStack {
           //     if !movie.ratingText.isEmpty {
           //         Text(movie.ratingText).foregroundColor(.yellow)
            //    }
                Text("⭐️ "+movie.scoreText)
           // }
            
            
            HStack {
                
                Text(movie.yearText)
                Text(movie.durationText)
            }
            
            Text(movie.overview)
            
            
            
            
            
        }.sheet(item: self.$selectedTrailer) { trailer in
            SafariView(url: trailer.youtubeURL!)
        }
    }
        .foregroundStyle(.white)
        .multilineTextAlignment(.center)
    }
}

struct MovieDetailImage: View {
    
    @ObservedObject var imageLoader: ImageLoader
    let imageURL: URL
    
    var body: some View {
        ZStack {
            
            Rectangle().fill(Color.gray.opacity(0.3))
            if self.imageLoader.image != nil {
                Image(uiImage: self.imageLoader.image!)
                    .resizable()
            }
            
            
            
        }
        .aspectRatio(16/9, contentMode: .fit)
        .onAppear {
            self.imageLoader.loadImage(with: self.imageURL)
        }
    }
}

#Preview {
    
        MovieDetailView(movieId: Movie.stubbedMovie.id)
    
}

