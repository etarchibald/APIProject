//
//  ViewController.swift
//  APIProject
//
//  Created by Ethan Archibald on 11/29/23.
//

import UIKit

class DogPictureViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var imageView: UIImageView!
    
    var dogController = DogController()
    
    var myDog = Dog(message: "", status: "")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.startAnimating()
        getMyDog()
        
    }
    
    func getMyDog() {
        Task {
            do {
                imageView.image = nil
                myDog = try await dogController.fetchItems()
                let imageData = try await dogController.getImageData(for: myDog.messageUrl)
                imageView.image = UIImage(data: imageData)
                activityIndicator.stopAnimating()
                
            } catch {
                print("Error, no dog")
                activityIndicator.stopAnimating()
            }
        }
    }

    @IBAction func newDog(_ sender: UIButton) {
        activityIndicator.startAnimating()
        getMyDog()
    }
    
}

