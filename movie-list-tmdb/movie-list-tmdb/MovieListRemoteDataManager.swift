//
//  MovieListDataManager.swift
//  movie-list-tmdb
//
//  Created by Swaminathan Nagarajan on 16/07/17.
//  Copyright © 2017 Swaminathan Nagarajan. All rights reserved.
//

import Foundation

import Alamofire
import AlamofireObjectMapper

class MovieListRemoteDataManager:MovieListRemoteDataManagerInputProtocol {
  
  var remoteRequestHandler: MovieListRemoteDataManagerOutputProtocol?
  
  func retrieveMovieList(page: Int) {
    let parameters: [String : Any] = [
      "api_key": Constants.API.API_KEY,
      "page": page,
      "primary_release_date.gte": "2017-07-01",
      "sort_by": "release_date.desc"
    ]
    Alamofire
      .request(Constants.API.MOVIE_DISCOVER_URL, method: .get, parameters: parameters)
      .validate()
      .responseObject(completionHandler: { (response: DataResponse<MovieResponse>) in
        switch response.result {
        case .success(let movieResponse):
          self.remoteRequestHandler?.onMoviesRetrieved(movieResponse.results, totalPages: movieResponse.total_pages!)
          
        case .failure( _):
          self.remoteRequestHandler?.onError()
        }
      })
  }
  
}
