//
//  FSHelper.swift
//  TMob FS Challenge
//
//  Created by Huseyin Yusuf on 29/04/2017.
//  Copyright © 2017 Huseyin Yusuf. All rights reserved.
//

import UIKit
import QuadratTouch
class FSHelper{
    public func setupSession(){
        let client = Client(clientID: "GAST5RT2DZB5CZUXJHT0GXIYXI5MUHMIHLPIAPIVJODOVU2K",
                            clientSecret: "VOPLNSCFS52Z05LMGCMATN40MZOHD2HS44K3WUVBIHUJ3BMB",
                            redirectURL: "https://www.FSChallengeByTMob.com")
        var configuration = Configuration(client:client)
        configuration.mode = nil
        configuration.shouldControllNetworkActivityIndicator = true
        Session.setupSharedSessionWithConfiguration(configuration)
        print("ow")
    }
}
