//
//  genrepick.swift
//  Movibility_app
//
//  Created by shomokh aldosari on 01/04/1445 AH.
//

import SwiftUI

struct genrepick: View {
    @State private var genres: [Genre] = []
    var body: some View {
        List(genres, id: \.id) { genre in
                  Text(genre.name)
              }
              .onAppear {
                  fetchGenres()
              }
    }
    func fetchGenres() {
           let apiKey = "ac5484aefe885aa01a92c7a178d9af51"
           let url = URL(string: "https://api.themoviedb.org/3/genre/movie/list?api_key=\(apiKey)&language=en-US")!

           URLSession.shared.dataTask(with: url) { data, response, error in
               if let data = data {
                   do {
                       let result = try JSONDecoder().decode(GenreListResponse.self, from: data)
                       DispatchQueue.main.async {
                           genres = result.genres
                       }
                   } catch {
                       print("Error decoding JSON: \(error)")
                   }
               }
           }.resume()
       }
}
struct genrepick_Previews: PreviewProvider {
    static var previews: some View {
        genrepick()
    }
}

struct GenreListResponse: Codable {
    let genres: [Genre]
}

struct Genre: Codable, Identifiable {
    let id: Int
    let name: String
}
#Preview {
    genrepick()
}
