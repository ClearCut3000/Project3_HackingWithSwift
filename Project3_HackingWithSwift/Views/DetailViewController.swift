//
//  DetailViewController.swift
//  Project3_HackingWithSwift
//
//  Created by Николай Никитин on 06.12.2021.
//

import UIKit

class DetailViewController: UIViewController {


  //MARK: - Properties
  @IBOutlet var imageView: UIImageView!
  var selectedImage: String?
  var totalNumberIfPictures = 0
  var numberOfSelectedPicture = 0

  //MARK: - ViewController LifeCicle
  override func viewDidLoad() {
    super.viewDidLoad()
    title = " This is image \(numberOfSelectedPicture) of \(totalNumberIfPictures) images"
    navigationItem.largeTitleDisplayMode = .never
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    if let imageToLoad = selectedImage {
      imageView.image = UIImage(named: imageToLoad)
    }
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.hidesBarsOnTap = true
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    navigationController?.hidesBarsOnTap = false
  }


 @objc func shareTapped () {
   guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else { return }
   let vc = UIActivityViewController(activityItems: [image, selectedImage ?? "No name picture"], applicationActivities: [])
    vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
    present(vc, animated: true)
  }

}
