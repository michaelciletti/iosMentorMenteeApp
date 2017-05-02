//
//  SignOutCode.swift
//  MinedMinds
//
//  Created by Michael & Sonya Ciletti on 5/2/17.
//  Copyright © 2017 Tula Ram Subba. All rights reserved.
//

import UIKit
import Firebase
import KeychainSwift

class SignOutCode: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

  
    
    @IBAction func SignOut (_ sender: Any){
    let firebaseAuth = FIRAuth.auth()
    do {
    try firebaseAuth?.signOut()
    } catch let signOutError as NSError {
    print ("Error signing out: %@", signOutError)
}
DataService().keyChain.delete("uid")
        dismiss(animated: true, completion: nil)
    }
}
