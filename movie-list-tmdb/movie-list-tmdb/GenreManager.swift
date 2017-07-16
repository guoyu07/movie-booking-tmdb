//
//  GenreManager.swift
//  movie-list-tmdb
//
//  Created by Swaminathan Nagarajan on 17/07/17.
//  Copyright © 2017 Swaminathan Nagarajan. All rights reserved.
//

import Foundation

import Alamofire
import AlamofireObjectMapper

class GenreManager {
  static let instance = GenreManager()
  private var genres: [Genre] = []
  
  func loadGenres() {
    retrieveGenres()
  }
  
  func getGenreNameById(id: Int) -> String {
    if genres.count > 0 {
      for genre in genres {
        if genre.id == id {
          return genre.name!
        }
      }
    }
    return ""
  }
  
  private func retrieveGenres() {
    let parameters: [String : Any] = [
      "api_key": Constants.API.API_KEY
    ]
    Alamofire
      .request(Constants.API.GENRE_URL, method: .get, parameters: parameters)
      .validate()
      .responseArray (keyPath: "genres") { (response: DataResponse<[Genre]>) -> Void in
        if response.result.isSuccess {
          self.genres = response.result.value!
        }
      }
  }
  
}
