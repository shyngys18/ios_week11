//
//  ViewController.swift
//  Multithreading
//
//  Created by erumaru on 2/29/20.
//  Copyright © 2020 kbtu. All rights reserved.
//

import UIKit
import SVProgressHUD

class ViewController: UIViewController {

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        uiNotOnMain()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        SVProgressHUD.show()
//        DispatchQueue.global(qos: .background).async {
//            self.bigTask()
//            DispatchQueue.main.async {
//                SVProgressHUD.dismiss()
//            }
//        }
//        print("QWERTY")
        SVProgressHUD.show(withStatus: "Its working")
        downloadFilms()
    }
    
    // MARK: - Methods
    //
    
    
    
    
    func downloadFilms() {
        guard let url = URL(string: "http://dummy.restapiexample.com/api/v1/employees")
              else { return }
        self.view.backgroundColor = .yellow

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
              
                    
               
                
                if let error = error {
                    DispatchQueue.main.async {
                    self.view.backgroundColor = .red
                    }
                    print(error)
                }
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(DownloadFilmsResponse.self, from: data)
                
                 SVProgressHUD.dismiss()
                
                    
                
                
                print(response.movies.map {$0.employee_name })
                
                
                 DispatchQueue.main.async {
                     self.view.backgroundColor = .green
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    // MARK: - Actions
   
}

class DownloadFilmsResponse: Codable {
    var movies: [Movie]
    
    
    enum CodingKeys: String, CodingKey {
        case movies = "data"
        
    }
}
