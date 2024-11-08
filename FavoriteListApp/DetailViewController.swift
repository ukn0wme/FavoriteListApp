//
//  DetailViewController.swift
//  FavoriteListApp
//
//  Created by Daniyal Nurgazinov on 08.11.2024.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    
    var itemTitle: String?
    var itemSubtitle: String?
    var itemDescription: String?
    var itemImageName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = itemTitle
        subtitleLabel.text = itemSubtitle
        descriptionLabel.text = itemDescription
        if let imageName = itemImageName {
            itemImageView.image = UIImage(named: imageName)
        }
    }
}
