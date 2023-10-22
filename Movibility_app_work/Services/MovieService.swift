//
//  MovieService.swift
//  Movibility_app
//
//  Created by shomokh aldosari on 26/03/1445 AH.
//

import Foundation
protocol MovieService{
    func fetchMovies(from endpoint: MovieListEndpoint, completion:@escaping (Result<MovieResponse, MovieError>) -> ())
    func fetchMovie(id: Int, completion:@escaping (Result<Movie, MovieError>) -> ())
    func searchMovie(query: String, completion:@escaping (Result<MovieResponse, MovieError>) ->())
}

enum MovieListEndpoint: String, CaseIterable {
    case nowPlaying = "now_playing"
    case upcoming
    case topRated = "top_rated"
    case popular
    
    var description: String{
        switch self {
        case .nowPlaying: return "Now Playing"
        case .upcoming: return "Upcoming"
        case .topRated: return "Top Rated"
        case .popular: return "Popular"
        }
    }
}

enum MovieError: Error {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializeationError
    
    var localizedDescription: String{
        switch self{
        case .apiError: return "Falied to fetch data"
        case .invalidEndpoint: return "Invalid Endpoint"
        case .invalidResponse: return "Invalid response"
        case .noData: return "No Data"
        case .serializeationError: return "Faild to decode data"
        }
    }
    
    var errorUserInfo: [String : Any]{
        [NSLocalizedDescriptionKey: localizedDescription]
    }
}
