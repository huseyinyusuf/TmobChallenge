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
    //function to get curent location of user and asd for permission
    public func getLocation(){
        self.locationManager.requestWhenInUseAuthorization()
        if( CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways){
            currentLocation = locationManager.location!
        }
        
    }
    // Necessary Input Controls are done here and Alerts are popped when required
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        var letters = NSCharacterSet.letters
        letters.insert(charactersIn: " ")
        if identifier == "PlacesSague"{
            if (typeTextField.text?.rangeOfCharacter(from: letters.inverted) != nil || (locationTextField.text?.rangeOfCharacter(from: letters.inverted)) != nil) {
                popOnlyCharacterAlert()
                return false

            }else{
                if (typeTextField.text?.characters.count)! >= 3{
                    return true
                }else{
                    popInvalidInputAlertDialog()
                    return false
                }
            }
        }
        return false
    }
    //Data transfer is done here
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
                    popInvalidInputAlertDialog()
                }
        }
    }
    // Alert for only character input
    func popOnlyCharacterAlert(){
        let alert=UIAlertController(
            title: "Input Error",
            message: "Please use ONLY Characters for Area Type and Location inputs",
            preferredStyle: UIAlertControllerStyle.alert)
        
        alert.addAction(UIAlertAction(
            title: "Done",
            style: UIAlertActionStyle.destructive,handler:{ (UIAlertAction) in
        }))
        self.present(alert, animated: true, completion: nil)
    }
    // Alert for Invalid Input
    func popInvalidInputAlertDialog(){
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
    
       override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Disabling the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        }


}

