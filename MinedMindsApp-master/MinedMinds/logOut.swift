//
//  logOut.swift
//  MinedMinds
//
//  Created by Tula Ram Subba on 5/1/17.
//  Copyright © 2017 Tula Ram Subba. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import KeychainSwift


class logOut: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        let keyChain = DataService().keyChain
        
        if keyChain.get("uid") != nil {
            performSegue(withIdentifier: "SignIn", sender: nil)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func CompleteSignIn (id: String){ let keyChain = DataService().keyChain
    
        keyChain.set(id, forKey: "uid")
    }
    
    
    @IBAction func SignIn(_ sender: Any){
        if let email = emailField.text, let password = passwordField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: password) { (user, error) in
                if error == nil {
                    self.CompleteSignIn(id: user!.uid)
                    self.performSegue(withIdentifier: "SignIn", sender: nil)
                } else  {
                    FIRAuth.auth()?.createUser(withEmail: email, password: password) { (user, error) in
                        if error != nil {
                            print("can't sign in user")
                        } else {
                            self.CompleteSignIn(id: user!.uid)
                            self.performSegue(withIdentifier: "SignIn", sender: nil)                        }
                    }
                }
            }
        }
    }
}
