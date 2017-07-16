//
//  MovieListWireFrame.swift
//  movie-list-tmdb
//
//  Created by Swaminathan Nagarajan on 16/07/17.
//  Copyright © 2017 Swaminathan Nagarajan. All rights reserved.
//

import Foundation
import UIKit

class MovieListWireFrame: MovieListWireFrameProtocol {
  
  class func createMovieListModule() -> UIViewController {
    let navController = mainStoryboard.instantiateViewController(withIdentifier: "MoviesNavigationController")
    if let view = navController.childViewControllers.first as? MovieListTableViewController {
      let presenter: MovieListPresenterProtocol & MovieListInteractorOutputProtocol = MovieListPresenter()
      let interactor: MovieListInteractorInputProtocol & MovieListRemoteDataManagerOutputProtocol = MovieListInteractor()
      let remoteDataManager: MovieListRemoteDataManagerInputProtocol = MovieListRemoteDataManager()
      let wireFrame: MovieListWireFrameProtocol = MovieListWireFrame()
      
      view.presenter = presenter
      presenter.view = view
      presenter.wireFrame = wireFrame
      presenter.interactor = interactor
      interactor.presenter = presenter
      interactor.remoteDatamanager = remoteDataManager
      remoteDataManager.remoteRequestHandler = interactor
      
      return navController
    }
    return UIViewController()
  }
  
  static var mainStoryboard: UIStoryboard {
    return UIStoryboard(name: "Main", bundle: Bundle.main)
  }
  
  
  func presentMovieDetailScreen(from view: MovieListViewProtocol, forMovie movie: Movie) {
    let movieDetailViewController = MovieDetailWireFrame.createMovieDetailModule(forMovie: movie)
    
    if let sourceView = view as? UIViewController {
      sourceView.navigationController?.pushViewController(movieDetailViewController, animated: true)
    }
  }
  
}
