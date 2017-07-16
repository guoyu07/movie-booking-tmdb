//
//  RootRouter.swift
//  movie-list-tmdb
//
//  Created by Swaminathan Nagarajan on 16/07/17.
//  Copyright © 2017 Swaminathan Nagarajan. All rights reserved.
//

import UIKit

class RootRouter {
  
  func presentFirstScreen(inWindow window: UIWindow) {
    presentMovieListScreen()
  }
  
  private func presentMovieListScreen() {
  }
  
  private func presentView(_ viewController: UIViewController) {
    guard let window = UIApplication.shared.delegate?.window! else { return }
    window.backgroundColor = UIColor.white
    window.makeKeyAndVisible()
    window.rootViewController = viewController
  }
}
