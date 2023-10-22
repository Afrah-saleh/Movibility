//
//  SeeAll_View.swift
//  Movibility_app
//
//  Created by Afrah Saleh on 27/03/1445 AH.
//

import SwiftUI

struct SeeAll_View: View {
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        //Use this if NavigationBarTitle is with displayMode = .inline
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.black]
    }
    @ObservedObject private var popularState = MovieListState()
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
                            if popularState.movies != nil {
                                MoviePosterScroll(title: "", movies: popularState.movies!)
                            } else {
                                LoadingView(isLoading: self.popularState.isLoading, error: self.popularState.error) {
                                    self.popularState.loadMovies(with: .popular)
                                }
                            }
                            
                            
                        }
                    } .onAppear {
                        self.popularState.loadMovies(with: .popular)
                      //  self.topRatedState.loadMovies(with: .topRated)

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
                    
       // }
    }
}

#Preview {
    SeeAll_View()
}
