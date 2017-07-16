//
//  MovieListInteractor.swift
//  movie-list-tmdb
//
//  Created by Swaminathan Nagarajan on 16/07/17.
//  Copyright © 2017 Swaminathan Nagarajan. All rights reserved.
//

import Foundation

class MovieListInteractor: MovieListInteractorInputProtocol {
  weak var presenter: MovieListInteractorOutputProtocol?
  var remoteDatamanager: MovieListRemoteDataManagerInputProtocol?
  
  func retrieveMovieList(page: Int) {
    remoteDatamanager?.retrieveMovieList(page: page)
  }
  
}

extension MovieListInteractor: MovieListRemoteDataManagerOutputProtocol {
  func onMoviesRetrieved(_ movies: [Movie]?, totalPages: Int) {
    presenter?.didRetrieveMovies(movies, totalPages: totalPages)
  }

  
  func onError() {
    presenter?.onError()
  }
  
}
