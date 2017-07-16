//
//  MovieDetailViewProtocol.swift
//  movie-list-tmdb
//
//  Created by Swaminathan Nagarajan on 17/07/17.
//  Copyright © 2017 Swaminathan Nagarajan. All rights reserved.
//

import Foundation
import UIKit

protocol MovieDetailViewProtocol: class {
  var presenter: MovieDetailPresenterProtocol? { get set }
  
  // PRESENTER -> VIEW
  func showMovieDetail(forMovie movie: Movie)
}

protocol MovieDetailWireFrameProtocol: class {
  static func createMovieDetailModule(forMovie movie: Movie) -> UIViewController
  func presentBookingScreen(from view: MovieDetailViewProtocol)
}

protocol MovieDetailPresenterProtocol: class {
  var view: MovieDetailViewProtocol? { get set }
  var wireFrame: MovieDetailWireFrameProtocol? { get set }
  var movie: Movie? { get set }
  
  // VIEW -> PRESENTER
  func viewDidLoad()
  func showBookingScreen()
}
