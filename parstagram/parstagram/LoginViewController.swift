//
//  LoginViewController.swift
//  parstagram
//
//  Created by Jonah Tjandra on 3/25/22.
//

import UIKit
import Parse

class LoginViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text!) { user, error in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegway", sender: nil)
            } else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        user.signUpInBackground { success, error in
            if (success) {
                self.performSegue(withIdentifier: "loginSegway", sender: nil)
            } else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
        
    }


}
