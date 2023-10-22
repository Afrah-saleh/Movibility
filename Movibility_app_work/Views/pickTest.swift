//
//  pickTest.swift
//  Movibility_app
//
//  Created by shomokh aldosari on 01/04/1445 AH.
//

import SwiftUI

struct pickTest: View {
    let g = ["Action","Science Fiction","Adventure"]
   
    let title: String
       let movies: [Movie]
    let movie: Movie
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack(alignment: .top, spacing: 3) {
                
                ForEach(self.movies) { movie in
                   //let x = ["Action"]
                    
                        
                        
                    if(!g.contains(movie.genreText)){
                        Text(movie.title)
                                
                            
                        }
                    
                    else{
                        Text("f")
                    }
                }
            
                
       }
    
}

    }
}

#Preview {
    pickTest(title: "", movies: Movie.stubbedMovies,movie: Movie.stubbedMovie)
}
