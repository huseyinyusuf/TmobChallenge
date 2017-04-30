//
//  PlacesViewController.swift
//  TMob FS Challenge
//
//  Created by Huseyin Yusuf on 28/04/2017.
//  Copyright © 2017 Huseyin Yusuf. All rights reserved.
//

import UIKit
import CoreLocation
class PlacesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var placesTableView: UITableView!
    var places=[Venue]()
    var typeInput="" //segue input
    var locationInput="" //segue input
    let locationManager=CLLocationManager()
    var currentlocation=CLLocation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placesTableView.delegate=self
        placesTableView.dataSource=self
        placesTableView.rowHeight = UITableViewAutomaticDimension
        placesTableView.estimatedRowHeight = 50
        loadArray(typeInp:typeInput,locationInp:locationInput)
        
    }
    //function to load Table data asychronously
    func loadArray(typeInp:String,locationInp:String){
        FSH.search(type:typeInp,location: locationInput) { (returnedPlaces) in
            DispatchQueue.main.async() { () -> Void in
            self.places=returnedPlaces
                self.placesTableView.reloadData()
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Table Functions
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Place", for: indexPath) as! PlaceTableViewCell
        cell.placeName.text = places[indexPath.row].name
        cell.placeAdress.text = places[indexPath.row].adress
        cell.country.text = places[indexPath.row].country
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }
    
    // Make data transfer before Seque is done
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PlaceDetail"{
            
            if let nextViewController = segue.destination as? PlaceDetailPopUpViewController{
                if let indexPath = placesTableView.indexPathForSelectedRow{
                    nextViewController.imageUrl=places[indexPath.row].url
                    nextViewController.venueName=places[indexPath.row].name
                }
            }
        }
    }
}
