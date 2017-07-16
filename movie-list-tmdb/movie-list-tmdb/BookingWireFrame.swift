//
//  BookingWireFrame.swift
//  movie-list-tmdb
//
//  Created by Swaminathan Nagarajan on 17/07/17.
//  Copyright © 2017 Swaminathan Nagarajan. All rights reserved.
//

import Foundation

import Foundation
import UIKit

class BookingWireFrame: BookingWireFrameProtocol {
  
  class func createBooking() -> UIViewController {
    let viewController = mainStoryboard.instantiateViewController(withIdentifier: "BookingController")
    if viewController is BookingViewController {
      return viewController
    }
    return UIViewController()
  }
  
  static var mainStoryboard: UIStoryboard {
    return UIStoryboard(name: "Booking", bundle: Bundle.main)
  }
  
  func presentBookingScreen(from view: MovieDetailViewProtocol) {
    let bookingVC = BookingWireFrame.createBooking()
    
    if let sourceView = view as? UIViewController {
      sourceView.navigationController?.pushViewController(bookingVC, animated: true)
    }
  }
}
