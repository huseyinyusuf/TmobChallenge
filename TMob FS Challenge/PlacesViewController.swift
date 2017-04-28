//
//  PlacesViewController.swift
//  TMob FS Challenge
//
//  Created by Huseyin Yusuf on 28/04/2017.
//  Copyright © 2017 Huseyin Yusuf. All rights reserved.
//

import UIKit

class PlacesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var placesTableView: UITableView!
    var fruits = ["Apple", "Apricot", "Banana", "Blueberry", "Cantaloupe", "Cherry",
                  "Clementine", "Coconut", "Cranberry", "Fig", "Grape", "Grapefruit",
                  "Kiwi fruit", "Lemon", "Lime", "Lychee", "Mandarine", "Mango",
                  "Melon", "Nectarine", "Olive", "Orange", "Papaya", "Peach",
                  "Pear", "Pineapple", "Raspberry", "Strawberry"]
    override func viewDidLoad() {
        super.viewDidLoad()
        placesTableView.delegate=self
        placesTableView.dataSource=self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Place", for: indexPath) as! PlaceTableViewCell
        cell.placeName?.text = fruits[indexPath.row]
        return cell
    }

}
