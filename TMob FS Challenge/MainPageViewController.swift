//
//  ViewController.swift
//  TMob FS Challenge
//
//  Created by Huseyin Yusuf on 28/04/2017.
//  Copyright © 2017 Huseyin Yusuf. All rights reserved.
//

import UIKit
import CoreLocation
let FSH=FSHelper()
class MainPageViewController: UIViewController,UITextFieldDelegate{

    @IBOutlet weak var searchButton: UIView!
    @IBOutlet weak var areaTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    var places=[Venue]()
    let locationManager=CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        searchButton.layer.cornerRadius=5
        areaTextField.delegate=self
        locationTextField.delegate=self
        getLocation()

        
    }
    public func getLocation(){
        self.locationManager.requestWhenInUseAuthorization()
        var currentLocation = CLLocation()
        
        if( CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways){
            
            currentLocation = locationManager.location!
//            let lat=currentLocation.coordinate.latitude
//            let long=currentLocation.coordinate.longitude
//            print(lat)
//            print(long)
            
        }
        
    }
//    @IBAction func SearchButtonPressed(_ sender: UITapGestureRecognizer) {
//        
//    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "PlacesSague"{
//            
//            if let nextViewController = segue.destination as? PlacesViewController{
//                    nextViewController.places=self.places
//                }
//        }
//    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        }


}

