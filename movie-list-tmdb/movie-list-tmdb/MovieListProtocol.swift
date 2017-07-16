//
//  MovieListProtocol.swift
//  movie-list-tmdb
//
//  Created by Swaminathan Nagarajan on 16/07/17.
//  Copyright © 2017 Swaminathan Nagarajan. All rights reserved.
//

import Foundation
import UIKit

protocol MovieListViewProtocol: class {
  var presenter: MovieListPresenterProtocol? { get set }
  
  // PRESENTER -> VIEW
  func showMovies(with movies: [Movie]?, totalPages: Int)
  
  func showError()
  
  func showLoading()
  
  func hideLoading()
}

protocol MovieListWireFrameProtocol: class {
  static func createMovieListModule() -> UIViewController
  // PRESENTER -> WIREFRAME
  func presentMovieDetailScreen(from view: MovieListViewProtocol, forMovie movie: Movie)
}

protocol MovieListPresenterProtocol: class {
  var view: MovieListViewProtocol? { get set }
  var interactor: MovieListInteractorInputProtocol? { get set }
  var wireFrame: MovieListWireFrameProtocol? { get set }
  
  // VIEW -> PRESENTER
  func refreshView(page: Int)
  func showMovieDetail(forMovie movie: Movie)
}

protocol MovieListInteractorOutputProtocol: class {
  // INTERACTOR -> PRESENTER
  func didRetrieveMovies(_ movies: [Movie]?, totalPages: Int)
  func onError()
}

protocol MovieListInteractorInputProtocol: class {
  var presenter: MovieListInteractorOutputProtocol? { get set }
  var remoteDatamanager: MovieListRemoteDataManagerInputProtocol? { get set }
  
  // PRESENTER -> INTERACTOR
  func retrieveMovieList(page: Int)
}

protocol MovieListRemoteDataManagerInputProtocol: class {
  var remoteRequestHandler: MovieListRemoteDataManagerOutputProtocol? { get set }
  
  // INTERACTOR -> REMOTEDATAMANAGER
  func retrieveMovieList(page: Int)
}

protocol MovieListRemoteDataManagerOutputProtocol: class {
  // REMOTEDATAMANAGER -> INTERACTOR
  func onMoviesRetrieved(_ movies: [Movie]?, totalPages: Int)
  func onError()
}
