//
//  Constants.swift
//  movie-list-tmdb
//
//  Created by Swaminathan Nagarajan on 16/07/17.
//  Copyright © 2017 Swaminathan Nagarajan. All rights reserved.
//

import Foundation

struct Constants {
  struct API {
    static let API_BASE_URL = "https://api.themoviedb.org/3"
    static let API_KEY = "<YOUR-API-KEY>"
    static let BASE_IMG_URL_W500 = "https://image.tmdb.org/t/p/w500"
    static let BASE_IMG_URL_W1000 = "https://image.tmdb.org/t/p/w1000"
    static let GENRE_URL = API_BASE_URL + "/genre/movie/list"
    static let MOVIE_DISCOVER_URL = API_BASE_URL + "/discover/movie"
  }
  struct Error {
    static let GENERAL_ERROR = "Sorry! something went wrong! Please try again"
  }
  struct Booking {
    static let BOOKING_URL = "https://www.cathaycineplexes.com.sg/movies"
  }
}
