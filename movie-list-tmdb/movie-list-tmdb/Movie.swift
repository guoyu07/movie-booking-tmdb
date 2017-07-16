//
//  Movie.swift
//  movie-list-tmdb
//
//  Created by Swaminathan Nagarajan on 16/07/17.
//  Copyright © 2017 Swaminathan Nagarajan. All rights reserved.
//

import ObjectMapper

class Movie : Mappable {
  var id: Int?
  var title: String?
  var popularity: Double?
  var poster_path: String?
  var original_language: String?
  var genre_ids: Array<Int>?
  var backdrop_path: String?
  var overview: String?
  
  convenience required init?(map: Map) {
    self.init()
  }
  
  func mapping(map: Map) {
    id <- map["id"]
    title <- map["title"]
    popularity <- map["popularity"]
    poster_path <- map["poster_path"]
    original_language <- map["orginal_language"]
    genre_ids <- map["genre_ids"]
    backdrop_path <- map["backdrop_path"]
    overview <- map["overview"]
  }
}
