//
//  Discover.swift
//  Movibility_app
//
//  Created by Afrah Saleh on 27/03/1445 AH.
//

import SwiftUI

struct Discover: View {

    @ObservedObject private var topRatedState = MovieListState()
    @ObservedObject private var popularState = MovieListState()
    @ObservedObject var movieSearchState = MovieSearchState()
    var body: some View {
        
        NavigationView {
            
            ZStack {
                Color.darkBlue
                        .ignoresSafeArea()

     
                    ScrollView {
                        VStack {
            
                            SearchBarView(placeholder: "Search movies", text: self.$movieSearchState.query)
                               // .listRowInsets(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
                            LoadingView(isLoading: self.movieSearchState.isLoading, error: self.movieSearchState.error) {
                                self.movieSearchState.search(query: self.movieSearchState.query)
                            }; if self.movieSearchState.movies != nil {
                                ForEach(self.movieSearchState.movies!) { movie in
                                    NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
                                        Divider()
                                       // VStack(alignment: .leading) {
                                            Text(movie.title)
                                            Text(movie.yearText)
                                       // }
                                    }
                                }
                            }
                            HStack{
                                Text("Top Movies")
                                    .multilineTextAlignment(.trailing)
                                    .padding(.leading, -10)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                                NavigationLink(destination: SeeAll_View(), label: {
                                    Text("See All")
                                        .foregroundColor(.lightblue)
                                        .font(.subheadline)
                                        .padding(.leading, 180)
                                        .fixedSize()
                                })
                                
                            }
                            Group {
                                if popularState.movies != nil {
                                    MoviePosterCarouselView(title: "", movies: popularState.movies!)
                                } else {
                                    LoadingView(isLoading: self.popularState.isLoading, error: self.popularState.error) {
                                        self.popularState.loadMovies(with: .popular)
                                    }
                                }
                                
                                
                            }
                            Spacer()
                            Spacer()
                            HStack{
                                Text("Top Rated")
                                    .multilineTextAlignment(.trailing)
                                    .padding(.leading, -10)
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.white)
                                NavigationLink(destination: SeeAll_2(), label: {
                                    Text("See All")
                                        .foregroundColor(.lightblue)
                                        .font(.subheadline)
                                        .padding(.leading, 180)
                                        .fixedSize()
                                    
                                }
                                )
                            }
                            Group {
                                if topRatedState.movies != nil {
                                    MovieBackdropCarouselView(title: "Top Rated", movies: topRatedState.movies!)
                                    
                                } else {
                                    LoadingView(isLoading: self.topRatedState.isLoading, error: self.topRatedState.error) {
                                        self.topRatedState.loadMovies(with: .topRated)
                                    }
                                }
                                
                                
                            }                                }
                        .onAppear {
                            self.popularState.loadMovies(with: .popular)
                            self.topRatedState.loadMovies(with: .topRated)
                            self.movieSearchState.startObserve()

                        }
                        
                    }
                    
                }
            .navigationTitle("Discover")
            .toolbarColorScheme(.dark, for: .navigationBar)
                    .toolbarBackground(

                        // 1
                        Color.darkBlue,
                        // 2
                        for: .navigationBar)
                    .toolbarBackground(.visible, for: .navigationBar)
                    .navigationBarTitleDisplayMode(.large)

            }
                }
    }
    

#Preview {
    Discover()
}
