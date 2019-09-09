//
//  AppSession.swift
//  EOSBlock
//
//  Created by Jason wang on 9/9/19.
//  Copyright © 2019 Jason Wang. All rights reserved.
//

import Foundation

class AppSession {
    // lazy load
    lazy var eosManager: EOSManagerable = {
        // TODO: DEBUG Flag Check
        Mock_EOSManager()
    }()

}
