//
//  MovieListTableViewController.swift
//  movie-list-tmdb
//
//  Created by Swaminathan Nagarajan on 16/07/17.
//  Copyright © 2017 Swaminathan Nagarajan. All rights reserved.
//

import UIKit
import SVProgressHUD

class MovieListTableViewController: UITableViewController {
  let MOVIE_CELL_ID = "MovieCell"
  var presenter: MovieListPresenterProtocol?
  let refreshController = UIRefreshControl()

  var movies: [Movie] = []
  var page = 1
  var prevPage = 0
  var totalPages = 2
  var pageThreshold = 20

  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.navigationBar.barTintColor = UIColor.blue
    self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
    self.navigationController?.navigationBar.tintColor = UIColor.white

    refreshController.addTarget(self, action: #selector(MovieListTableViewController.refreshView), for: .valueChanged)
    tableView.addSubview(refreshController)
    refreshView()
  }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }
  
  func refreshView() -> Void {
    self.movies.removeAll()
    self.tableView.reloadData()
    page = 1
    prevPage = page - 1
    totalPages = page + 1
    presenter?.refreshView(page: page)
  }
}

// MARK: - Table view data source
extension MovieListTableViewController {

  override func numberOfSections(in tableView: UITableView) -> Int {
      // #warning Incomplete implementation, return the number of sections
      return movies.count
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      // #warning Incomplete implementation, return the number of rows
      return 1
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // Pagination
    if (page < totalPages && movies.count - (indexPath as NSIndexPath).section <= pageThreshold) {
      if (page > prevPage) {
        prevPage = page
        presenter?.refreshView(page: page)
      }
    }
    let cell = tableView.dequeueReusableCell(withIdentifier: MOVIE_CELL_ID, for: indexPath) as! MovieTableViewCell
    
    // Configure the cell...
    let movie = movies[indexPath.section]
    cell.set(forMovie: movie)
    
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    presenter?.showMovieDetail(forMovie: movies[indexPath.section])
  }
}

extension MovieListTableViewController: MovieListViewProtocol {
  func showMovies(with movies: [Movie]?, totalPages: Int) {
    print("Hello: \(page) Count: \(self.movies.count)")
    if let movies = movies {
      self.movies += movies
      self.totalPages = totalPages
      tableView.reloadData()
    }
    page += 1
    if (refreshController.isRefreshing) {
      refreshController.endRefreshing()
    }
  }
  
  func showError() {
    SVProgressHUD.showError(withStatus: Constants.Error.GENERAL_ERROR)
  }
  
  func showLoading() {
    SVProgressHUD.show()
  }
  
  func hideLoading() {
    SVProgressHUD.dismiss()
  }
  
}

