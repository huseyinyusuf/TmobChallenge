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
    static let sharedInstance = FSHelper()
    var session:Session?
    var ClientId="GAST5RT2DZB5CZUXJHT0GXIYXI5MUHMIHLPIAPIVJODOVU2K"
    var ClientSecret="VOPLNSCFS52Z05LMGCMATN40MZOHD2HS44K3WUVBIHUJ3BMB"
    init(){
        let client = Client(clientID: ClientId,
                            clientSecret: ClientSecret,
                            redirectURL: "https://www.FSChallengeByTMob.com")
        let configuration = Configuration(client:client)
        Session.setupSharedSessionWithConfiguration(configuration)
        self.session=Session.sharedSession()
        print("Session Created!")
    }
    func search(location:CLLocation,getPlaces: @escaping (_ array: [Venue])-> Void){
        var places=[Venue]()
        if let session = self.session
        {
            var parameters = [Parameter.query:"food"]
            parameters += location.parameters()
            parameters += [Parameter.categoryId: "4bf58dd8d48988d1e0931735"]
            parameters += [Parameter.radius: "10000"]
            parameters += [Parameter.limit: "15"]
            
            let searchTask = session.venues.search(parameters)
            {
                (result) -> Void in
                
                if let response = result.response
                {
                    if let venues = response["venues"] as? [[String: AnyObject]]
                    {
                        
                        for venue:[String: AnyObject] in venues
                        {
                            let place = Venue()
                            
                            if let name = venue["name"] as? String
                            {
                                place.name = name
                            }
                            
                            if  let location = venue["location"] as? [String: AnyObject]
                            {
                                if let address = location["address"] as? String
                                {
                                    place.adress = address
                                }
                                if let country = location["country"] as? String
                                {
                                    place.country = country
                                }
                            }
                            if let id = venue["id"] as? String
                            {
                                place.id = id
                            }
                            
//                            print(response)
                            print(place.name)
//                            print(place.adress)
//                            print(place.id)
//                            print("\n")
                            places.append(place)
                        }
                        print("finished")
                        getPlaces(places)
                    }
                
                }
            }
            searchTask.start()
        }
    }

}
extension CLLocation
{
    func parameters() -> Parameters
    {
        let ll      = "\(self.coordinate.latitude),\(self.coordinate.longitude)"
        let llAcc   = "\(self.horizontalAccuracy)"
        let alt     = "\(self.altitude)"
        let altAcc  = "\(self.verticalAccuracy)"
        let parameters = [
            Parameter.ll:ll,
            Parameter.llAcc:llAcc,
            Parameter.alt:alt,
            Parameter.altAcc:altAcc
        ]
        return parameters
    }
}
