//
//  DataService.swift
//  MinedMinds
//
//  Created by Michael & Sonya Ciletti on 5/2/17.
//  Copyright © 2017 Tula Ram Subba. All rights reserved.
//

import Foundation
import Firebase
import KeychainSwift
import FirebaseDatabase

let DB_Base = FIRDatabase.database().reference()

class DataService {
    private var _keyChain = KeychainSwift()
    private var _refDatabase = DB_Base
    
    var keyChain: KeychainSwift { get {
        return _keyChain
        } set  {
            _keyChain = newValue
        }
        }
}
