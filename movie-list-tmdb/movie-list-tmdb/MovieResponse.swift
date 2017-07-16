//
//  MovieResponse.swift
//  movie-list-tmdb
//
//  Created by Swaminathan Nagarajan on 16/07/17.
//  Copyright © 2017 Swaminathan Nagarajan. All rights reserved.
//

import ObjectMapper
class MovieResponse: Mappable {
  var results: [Movie]?
  var total_pages: Int?
  convenience required init?(map: Map) {
    self.init()
  }
  
  func mapping(map: Map) {
    total_pages <- map["total_pages"]
    results <- map["results"]
  }
}
