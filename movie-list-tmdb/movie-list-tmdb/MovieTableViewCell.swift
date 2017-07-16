//
//  MovieTableViewCell.swift
//  movie-list-tmdb
//
//  Created by Swaminathan Nagarajan on 16/07/17.
//  Copyright © 2017 Swaminathan Nagarajan. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieTableViewCell: UITableViewCell {

  @IBOutlet weak var movieImage: UIImageView!
  @IBOutlet weak var titleLbl: UILabel!
  @IBOutlet weak var popularityLbl: UILabel!
  func set(forMovie movie: Movie) {
    self.selectionStyle = .none
    titleLbl?.text = movie.title
    if let popularity = movie.popularity {
      popularityLbl.text = "Popularity: \(popularity)"
    }
    movieImage.image = UIImage(named: "placeholder")
    if let imagePath = movie.poster_path {
      let url = URL(string: Constants.API.BASE_IMG_URL_W500 + imagePath)!
      let placeholderImage = UIImage(named: "placeholder")!
      movieImage?.af_setImage(withURL: url, placeholderImage: placeholderImage)
    }
  }
}
