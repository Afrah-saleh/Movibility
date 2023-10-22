//
//  MovieResponse.swift
//  Movibility_app
//
//  Created by shomokh aldosari on 26/03/1445 AH.
//

import Foundation
struct MovieResponse: Decodable {
    let results: [Movie]
}
struct Movie: Decodable, Identifiable {
    let id: Int
    let title: String
    let backdropPath: String?
    let posterPath: String?
    let overview: String
    let voteAverage: Double
    let voteCount: Int
    let runtime: Int?
    let releaseDate: String?
    
    let genres: [MovieGenre]?
    
    let videos: MovieVideoResponse?
    
    var backdropURL: URL {
            return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath ?? "")")!
        }
    var posterURL: URL {
            return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")!
        }
    
    static private let yearFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy"
            return formatter
        }()
        
        static private let durationFormatter: DateComponentsFormatter = {
            let formatter = DateComponentsFormatter()
            formatter.unitsStyle = .full
            formatter.allowedUnits = [.hour, .minute]
            return formatter
        }()
    
    var ratingText: String {
         let rating = Int(voteAverage)
         let ratingText = (0..<rating).reduce("") { (acc, _) -> String in
             return acc + "★"
         }
         return ratingText
     }
     
     var scoreText: String {
         guard ratingText.count > 0 else {
             return "n/a"
         }
         return "\(ratingText.count)/10"
     }
     
     var yearText: String {
         guard let releaseDate = self.releaseDate, let date = Utils.dataFormatter.date(from: releaseDate) else {
             return "n/a"
         }
         return Movie.yearFormatter.string(from: date)
     }
     
     var durationText: String {
         guard let runtime = self.runtime, runtime > 0 else {
             return "n/a"
         }
         return Movie.durationFormatter.string(from: TimeInterval(runtime) * 60) ?? "n/a"
     }
    var genreText: String {
            //genres?.first?.name ?? "n/a"
       // print(genres)
        guard let genres = genres else{
            return "n/a"
        }
        let genreNames = genres.map { $0.name }
        return genreNames.joined(separator: ", ")
        }
    var youtubeTrailers: [MovieVideo]? {
           videos?.results.filter { $0.youtubeURL != nil }
       }

        
}
struct MovieGenre: Decodable {
    let name: String
}
struct MovieVideoResponse: Decodable {
    
    let results: [MovieVideo]
}

struct MovieVideo: Decodable, Identifiable {
    
    let id: String
    let key: String
    let name: String
    let site: String
    
    var youtubeURL: URL? {
        guard site == "YouTube" else {
            return nil
        }
        return URL(string: "https://youtube.com/watch?v=\(key)")
    }
}
