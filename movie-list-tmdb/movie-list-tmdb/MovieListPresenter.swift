//
//  MovieListPresenter.swift
//  movie-list-tmdb
//
//  Created by Swaminathan Nagarajan on 16/07/17.
//  Copyright © 2017 Swaminathan Nagarajan. All rights reserved.
//

import Foundation

class MovieListPresenter: MovieListPresenterProtocol {
  weak var view: MovieListViewProtocol?
  var interactor: MovieListInteractorInputProtocol?
  var wireFrame: MovieListWireFrameProtocol?
  
  func refreshView(page: Int) {
    view?.showLoading()
    interactor?.retrieveMovieList(page: page)
  }
  
  func showMovieDetail(forMovie movie: Movie) {
    wireFrame?.presentMovieDetailScreen(from: view!, forMovie: movie)
  }
  
}

extension MovieListPresenter: MovieListInteractorOutputProtocol {
  func didRetrieveMovies(_ movies: [Movie]?, totalPages: Int) {
    view?.hideLoading()
    view?.showMovies(with: movies, totalPages: totalPages)
  }

  func onError() {
    view?.hideLoading()
    view?.showError()
  }
  
}

