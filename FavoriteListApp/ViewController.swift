//
//  ViewController.swift
//  FavoriteListApp
//
//  Created by Daniyal Nurgazinov on 08.11.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let favoriteItems = [
        (title: "Где нас нет", subtitle: "Reflective and deep", imageName: "songImage1"),
        (title: "Кто убил Марка?", subtitle: "Story of identity", imageName: "songImage2"),
        (title: "Переплетено", subtitle: "Interwoven lives", imageName: "songImage3"),
        (title: "Не от мира сего", subtitle: "Alienation theme", imageName: "songImage4"),
        (title: "Биполярочка", subtitle: "Mental health focus", imageName: "songImage5"),
        (title: "Хоровод", subtitle: "Rap scene insights", imageName: "songImage6"),
        (title: "Всего лишь писатель", subtitle: "Artist’s journey", imageName: "songImage7"),
        (title: "Простые вещи", subtitle: "Life's simplicity", imageName: "songImage8"),
        (title: "Тентакли", subtitle: "Dark themes", imageName: "songImage9"),
        (title: "Колесо", subtitle: "Life’s cycles", imageName: "songImage10")
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Dequeue the cell using the identifier you set in the storyboard
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteItemCell", for: indexPath) as! FavoriteItemCell
        
        let item = favoriteItems[indexPath.row]
        
        cell.titleLabel.text = item.title
        cell.subtitleLabel.text = item.subtitle
        cell.itemImageView.image = UIImage(named: item.imageName) // Assumes you have images in Assets
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteItems.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetailSegue" {
            print("Segue is working!")
            if let detailVC = segue.destination as? DetailViewController,
               let indexPath = tableView.indexPathForSelectedRow {
                let selectedItem = favoriteItems[indexPath.row]
                
                // Pass data to DetailViewController
                detailVC.itemTitle = selectedItem.title
                detailVC.itemSubtitle = selectedItem.subtitle
                detailVC.itemDescription = "This is a description of \(selectedItem.title)"
                detailVC.itemImageName = selectedItem.imageName
            }
        }
    }
}

