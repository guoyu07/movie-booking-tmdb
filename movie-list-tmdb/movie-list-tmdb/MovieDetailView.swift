//
//  MovieDetailView.swift
//  movie-list-tmdb
//
//  Created by Swaminathan Nagarajan on 17/07/17.
//  Copyright © 2017 Swaminathan Nagarajan. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieDetailView: UIViewController {
  @IBOutlet weak var titleLbl: UILabel!
  @IBOutlet weak var movieImage: UIImageView!
  @IBOutlet weak var languageLbl: UILabel!
  @IBOutlet weak var overviewLbl: UILabel!
  @IBOutlet weak var genreLbl: UILabel!
  var presenter: MovieDetailPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      presenter?.viewDidLoad()
    }

  @IBAction func onBookingClick(_ sender: Any) {
    presenter?.showBookingScreen()
  }
}

extension MovieDetailView: MovieDetailViewProtocol {
  
  func showMovieDetail(forMovie movie: Movie) {
    self.title = movie.title
    titleLbl.text = movie.title
    movieImage.image = UIImage(named: "placeholder")
    if let imagePath = movie.backdrop_path {
      let url = URL(string: Constants.API.BASE_IMG_URL_W500 + imagePath)!
      let placeholderImage = UIImage(named: "placeholder")!
      movieImage?.af_setImage(withURL: url, placeholderImage: placeholderImage)
    }
    overviewLbl.text = movie.title
    if let synop = movie.overview {
     overviewLbl.text = synop
    }
    languageLbl.text = "Language: Unknown"
    if let lang = movie.original_language {
      languageLbl.text = "Language: \(lang)"
    }
    
    genreLbl.text = "Genres: Unknown"
    if let gens = movie.genre_ids {
      if (gens.count > 0) {
        var strGen = ""
        for gen in gens {
          strGen += GenreManager.instance.getGenreNameById(id: gen) + ", "
        }
        genreLbl.text = "Genres: \(strGen)"
      }
    }
  }
  
}
