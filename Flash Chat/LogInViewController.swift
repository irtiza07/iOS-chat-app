//
//  LogInViewController.swift
//  Flash Chat
//
//  This is the view controller where users login


import UIKit
import Firebase


class LogInViewController: UIViewController {

    //Textfields pre-linked with IBOutlets
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   
    @IBAction func logInPressed(_ sender: AnyObject) {

        
        //TODO: Log in the user
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) {
            user, error in
            if (error != nil) {
                print(error!)
                let alert = UIAlertController(title: "Login Failed", message: "Please try again with correct credentials", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true)
            } else {
                print("Login successful")
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
            self.emailTextfield.text = ""
            self.passwordTextfield.text = ""
        }
        
        
    }
    


    
}  
