//
//  MovieDetailWireFrame.swift
//  movie-list-tmdb
//
//  Created by Swaminathan Nagarajan on 17/07/17.
//  Copyright © 2017 Swaminathan Nagarajan. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailWireFrame: MovieDetailWireFrameProtocol {
  
  class func createMovieDetailModule(forMovie movie: Movie) -> UIViewController {
    let viewController = mainStoryboard.instantiateViewController(withIdentifier: "MovieDetailController")
    if let view = viewController as? MovieDetailView {
      let presenter: MovieDetailPresenterProtocol = MovieDetailPresenter()
      let wireFrame: MovieDetailWireFrameProtocol = MovieDetailWireFrame()
      
      view.presenter = presenter
      presenter.view = view
      presenter.movie = movie
      presenter.wireFrame = wireFrame
      
      return viewController
    }
    return UIViewController()
  }
  
  static var mainStoryboard: UIStoryboard {
    return UIStoryboard(name: "MovieDetail", bundle: Bundle.main)
  }
 
  func presentBookingScreen(from view: MovieDetailViewProtocol) {
    let bookingVC = BookingWireFrame.createBooking()
    
    if let sourceView = view as? UIViewController {
      sourceView.navigationController?.pushViewController(bookingVC, animated: true)
    }
  }

}

