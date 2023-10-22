//
//  Suggestion2.swift
//  Movibility_app
//
//  Created by shomokh aldosari on 30/03/1445 AH.
//

import SwiftUI

struct Suggestion2: View {
    let movieId: Int
       @ObservedObject private var movieDetailState = MovieDetailState()
       
    var body: some View {
        //           Color.darkBlue
        //               .ignoresSafeArea()
      //  NavigationView{
        ZStack {
            Rectangle().ignoresSafeArea()
                .foregroundColor(CustomColor.darkBlue)
            LoadingView(isLoading: self.movieDetailState.isLoading, error: self.movieDetailState.error) {
                self.movieDetailState.loadMovie(id: self.movieId)
            }
            
            if movieDetailState.movie != nil {
                MovieDetailListViewSuggestion2(movie: self.movieDetailState.movie!)
                
            }
        }
        .toolbarColorScheme(.dark, for: .navigationBar)
                .toolbarBackground(

                    // 1
                    Color.darkBlue,
                    // 2
                    for: .navigationBar)
   // }
          
           .onAppear {
               self.movieDetailState.loadMovie(id: self.movieId)
           }
           
       }
}
struct MovieDetailListViewSuggestion2: View {
    @State private var isFilled = false
    let movie: Movie
    @State private var selectedTrailer: MovieVideo?
    //  let imageLoader = ImageLoader()
    
    var body: some View {
        ScrollView{
            VStack (alignment: .center, spacing: 6){
                ZStack{
                    Rectangle().fill(Color.gray.opacity(0.3))
                    Image("Blue Beetle")
                    
                        .resizable()
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    
                } .aspectRatio(16/9, contentMode: .fit)
                
                
                if movie.youtubeTrailers != nil && movie.youtubeTrailers!.count > 0 {
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
                            Image(systemName: "play.circle.fill")
                                .resizable()
                                .frame(width: 50, height: 50)
                                .foregroundColor(CustomColor.lightblue)
                            //.padding(.horizontal, 150)
                                .offset(x:130, y: 0)
                                .font(.title)
                            Spacer()
                            
                                .font(.title)
                            Spacer()
                            NavigationLink(destination: Suggestion2(movieId: Movie.stubbedMovie.id)) {
                                Image(systemName: "arrow.clockwise.circle.fill")
                            }
                            
                            .foregroundColor(CustomColor.lightblue)
                            
                            .font(.title)
                            
                            
                            
                        }
                    }
                }
                
                Text("Blue Beetle")
                    .bold()
                    .font(.system(size: 30))
                    .padding()
                Text(movie.genreText)
                Text("⭐️ "+"6/10")
                
                
                
                
                HStack {
                    
                    Text("2023")
                    Text("2h 8m")
                }
                .padding()
                Text("Recent college grad Jaime Reyes returns home full of aspirations for his future, only to find that  home is not quite as he left it.\n As he searches to find his purpose in the world, fate intervenes\n when Jaime unexpectedly finds himself in possession of an ancient \nrelic of alien biotechnology: the Scarab.")
                
                    .font(.system(size: 15))
                
                
                
                
                
                
            }.sheet(item: self.$selectedTrailer) { trailer in
                SafariView(url: trailer.youtubeURL!)
            }
            .foregroundStyle(.white)
            .multilineTextAlignment(.center)
        }
    }
}
struct MovieDetailImageSuggestion2: View {
    
  //  @ObservedObject var imageLoader: ImageLoader
    let imageURL: URL
    
    var body: some View {
        ZStack {
            
            Rectangle().fill(Color.gray.opacity(0.3))
          //  if self.imageLoader.image != nil {
                //Image("Blue Beetle ")
                   // .resizable()
           // }
            
            
            
        }
        .aspectRatio(16/9, contentMode: .fit)
        .onAppear {
           // self.imageLoader.loadImage(with: self.imageURL)
        }
    }
}




#Preview {
    Suggestion2(movieId: Movie.stubbedMovie.id)
}
