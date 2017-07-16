//
//  MovieDetailPresenter.swift
//  movie-list-tmdb
//
//  Created by Swaminathan Nagarajan on 17/07/17.
//  Copyright © 2017 Swaminathan Nagarajan. All rights reserved.
//

import Foundation

class MovieDetailPresenter: MovieDetailPresenterProtocol {
  weak var view: MovieDetailViewProtocol?
  var wireFrame: MovieDetailWireFrameProtocol?
  var movie: Movie?
  
  func viewDidLoad() {
    view?.showMovieDetail(forMovie: movie!)
  }
 
  func showBookingScreen() {
    wireFrame?.presentBookingScreen(from: view!)
  }
}

