//
//  RegisterViewController.swift
//  Flash Chat
//
//  This is the View Controller which registers new users with Firebase
//

import UIKit
import Firebase


class RegisterViewController: UIViewController {

    
    //Pre-linked IBOutlets

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  
    @IBAction func registerPressed(_ sender: AnyObject) {
        print("Registration handler")
        //TODO: Set up a new user on our Firbase database
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            if error != nil {
                print(error!)
                let alert = UIAlertController(title: "Registration Failed", message: "Please input correct email and password", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true)
                self.emailTextfield.text = ""
                self.passwordTextfield.text = ""
                
            } else {
                print("Registration successfull")
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }
        

        
        
    } 
    
    
}
