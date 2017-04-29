//
//  FSHelper.swift
//  TMob FS Challenge
//
//  Created by Huseyin Yusuf on 29/04/2017.
//  Copyright © 2017 Huseyin Yusuf. All rights reserved.
//

import UIKit
import Foundation
import QuadratTouch
import CoreLocation
import MapKit
class FSHelper{
    var session: Session!
    var location: CLLocation!
    var venues: [NSData]!
    let distanceFormatter = MKDistanceFormatter()
    var currentTask: Task?
    public func setupSession(){
        let client = Client(clientID: "GAST5RT2DZB5CZUXJHT0GXIYXI5MUHMIHLPIAPIVJODOVU2K",
                            clientSecret: "VOPLNSCFS52Z05LMGCMATN40MZOHD2HS44K3WUVBIHUJ3BMB",
                            redirectURL: "https://www.FSChallengeByTMob.com")
        var configuration = Configuration(client:client)
        configuration.mode = nil
        configuration.shouldControllNetworkActivityIndicator = true
        Session.setupSharedSessionWithConfiguration(configuration)
        print("Session Creared!")
        //getLocation()
        //search()
    }

    public func search(){
        var parameters = [Parameter.query:"Burgers"]
        //parameters += self.location.parameters()
        let searchTask = session.venues.search(parameters) {
            (result) -> Void in
            if let response = result.response {
                print(response["venues"] as! [NSData]?)
//                self.venues = response["venues"] as [JSONParameters]?
//                self.tableView.reloadData()
            }
        }
        searchTask.start()
    }
}
