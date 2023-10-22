//
//  SeeAll_2.swift
//  Movibility_app
//
//  Created by Afrah Saleh on 27/03/1445 AH.
//

import SwiftUI

struct SeeAll_2: View {
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.black]
    }
    @ObservedObject private var topRatedState = MovieListState()
    @State var searchText = ""
    @State var selected = 1
    var body: some View {
       // NavigationView {
            ZStack {
                Color("darkBlue")
                    .ignoresSafeArea()
                //                    .navigationTitle("Movies")
                    .searchable(text: $searchText)
                ScrollView {
                    VStack {
                        Group {
                            if topRatedState.movies != nil {
                                MoviePosterScroll(title: "", movies: topRatedState.movies!)
                                
                            } else {
                                LoadingView(isLoading: self.topRatedState.isLoading, error: self.topRatedState.error) {
                                    self.topRatedState.loadMovies(with: .topRated)
                                }
                            }
                            
                            
                        }                                }
                    .onAppear {
                        self.topRatedState.loadMovies(with: .topRated)
                    }
                }
            }
            .navigationBarTitle("Movies", displayMode: .inline)
            .toolbarColorScheme(.dark, for: .navigationBar)
                    .toolbarBackground(

                        // 1
                        Color.darkBlue,
                        // 2
                        for: .navigationBar)
                    .toolbarBackground(.visible, for: .navigationBar)
        }
        
   // }
    
}

#Preview {
    SeeAll_2()
}
