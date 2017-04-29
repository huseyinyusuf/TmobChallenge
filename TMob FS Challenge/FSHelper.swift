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
    init(){
        let client = Client(clientID: "GAST5RT2DZB5CZUXJHT0GXIYXI5MUHMIHLPIAPIVJODOVU2K",
                            clientSecret: "VOPLNSCFS52Z05LMGCMATN40MZOHD2HS44K3WUVBIHUJ3BMB",
                            redirectURL: "https://www.FSChallengeByTMob.com")
        let configuration = Configuration(client:client)
        Session.setupSharedSessionWithConfiguration(configuration)
        self.session=Session.sharedSession()
        print("Session Creared!")
    }
    func search(location:CLLocation)
    {
        if let session = self.session
        {
            var parameters = [Parameter.query:"Cafe"]
            parameters += location.parameters()
            parameters += [Parameter.categoryId: "4bf58dd8d48988d1e0931735"]
            parameters += [Parameter.radius: "300"]
            parameters += [Parameter.limit: "10"]
            
            let searchTask = session.venues.search(parameters)
            {
                (result) -> Void in
                
                if let response = result.response
                {
                    print(result)
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
