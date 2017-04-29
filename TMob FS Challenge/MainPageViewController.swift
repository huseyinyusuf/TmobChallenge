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
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    var places=[Venue]()
    var currentLocation=CLLocation()
    let locationManager=CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        searchButton.layer.cornerRadius=5
        typeTextField.delegate=self
        locationTextField.delegate=self
        getLocation()
    }
    public func getLocation(){
        self.locationManager.requestWhenInUseAuthorization()
        if( CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways){
            
            currentLocation = locationManager.location!
//            let lat=currentLocation.coordinate.latitude
//            let long=currentLocation.coordinate.longitude
//            print(lat)
//            print(long)
            
        }
        
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "PlacesSague"{
            if (typeTextField.text?.characters.count)! >= 3{
                return true
            }else{
                popAlertDialog()
                return false
            }
        }
        return false
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PlacesSague"{
            
            if let nextViewController = segue.destination as? PlacesViewController{
                    nextViewController.typeInput=typeTextField.text!
                    if(locationTextField.text?.characters.count == 0){
                        nextViewController.locationInput = "empty"
                    }else{
                        nextViewController.locationInput=locationTextField.text!
                    }
                }else{
                    popAlertDialog()
                }
        }
    }
    func popAlertDialog(){
        let alert=UIAlertController(
            title: "Input Error",
            message: "Are type must consist minimum 3 Characters",
            preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(
            title: "Done",
            style: UIAlertActionStyle.destructive,handler:{ (UIAlertAction) in
        }))
        self.present(alert, animated: true, completion: nil)
    }
    /*func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let set = NSCharacterSet(charactersIn: "ABCDEFGHIJKLMONPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789 ").inverted
        let stringSet : String = string as String
        return stringSet.rangeOfCharacter(from: set.inverted, options: String.CompareOptions.caseInsensitive) == nil
        
    }
    */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        }


}

