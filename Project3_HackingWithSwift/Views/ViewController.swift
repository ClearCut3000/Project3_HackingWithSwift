//
//  ViewController.swift
//  Project3_HackingWithSwift
//
//  Created by Николай Никитин on 06.12.2021.
//

import UIKit

  class ViewController: UITableViewController {


    //MARK: - Properties
    var pictures = [String]()

    //MARK: - ViewDidLoad
    override func viewDidLoad() {

      super.viewDidLoad()
      title = "Storm Viewer"
      navigationController?.navigationBar.prefersLargeTitles = true
      let fileManager = FileManager.default

      let path = Bundle.main.resourcePath!
      let items = try! fileManager.contentsOfDirectory(atPath: path)

      for item in items {
        if item.hasPrefix("nssl"){
          // this is a picture to load
          pictures.append(item)
        }
      }
    }

    //MARK: - TableView Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return pictures.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
      pictures.sort()
      cell.textLabel?.text = pictures[indexPath.row]
      return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      if let viewController = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
        viewController.selectedImage = pictures[indexPath.row]
        viewController.numberOfSelectedPicture = indexPath.row + 1
        viewController.totalNumberIfPictures = pictures.count
        navigationController?.pushViewController(viewController, animated: true)
      }
    }
  }


