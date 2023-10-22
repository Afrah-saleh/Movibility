//
//  Tabviews1.swift
//  Movibility_app
//
//  Created by Afrah Saleh on 27/03/1445 AH.
//

import SwiftUI

struct Tabviews1: View {
    init() {
        UITabBar.appearance().backgroundColor =
        UIColor(named: "Background1")
        UITabBar.appearance().unselectedItemTintColor = UIColor(named: "Background1")
        
    }
    var body: some View {
        ZStack{
            //NavigationView {
            TabView {
                
                Discover()
                    .tabItem {
                        Label("Discover", systemImage: "square.grid.2x2")
                    }
                Picker1()
                    .tabItem {
                        Label("Picker", systemImage: "hand.point.up.braille.fill")
                    }
                Favorite(title: "", movies: Movie.stubbedMovies, movie: Movie.stubbedMovie)
                    .tabItem {
                        Label("Favorite", systemImage: "star.fill")
                    }
                
                    
                
            }
            .accentColor(.lightblue)
            .onAppear() {
                                    UITabBar.appearance().barTintColor = .darkBlue
                                       }
//            .toolbarBackground(Color.darkBlue, for: .tabBar)
        }
    }}

#Preview {
    Tabviews1()
}
