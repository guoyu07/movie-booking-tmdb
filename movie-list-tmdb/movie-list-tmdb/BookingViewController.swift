//
//  BookingViewController.swift
//  movie-list-tmdb
//
//  Created by Swaminathan Nagarajan on 17/07/17.
//  Copyright © 2017 Swaminathan Nagarajan. All rights reserved.
//

import UIKit
import SVProgressHUD

class BookingViewController: UIViewController {

  @IBOutlet weak var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

      webView.loadRequest(NSURLRequest(url: NSURL(string: Constants.Booking.BOOKING_URL)! as URL) as URLRequest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension BookingViewController : UIWebViewDelegate {
  func webViewDidStartLoad(_ webView: UIWebView) {
    SVProgressHUD.show()
  }
  
  func webViewDidFinishLoad(_ webView: UIWebView) {
    SVProgressHUD.dismiss()
  }
}
