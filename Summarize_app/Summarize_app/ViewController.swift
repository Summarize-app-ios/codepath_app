//
//  ViewController.swift
//  Summarize_app
//
//  Created by Ahamed Arif on 4/3/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNameField: UITextField!

    @IBOutlet weak var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func signIn(_ sender: Any) {
        let username = userNameField.text!
        let password = passwordField.text!

        self.performSegue(withIdentifier: "success", sender: nil)

    }

    @IBAction func signUp(_ sender: Any) {

        let username = userNameField.text
        let password = passwordField.text

        self.performSegue(withIdentifier: "success", sender: nil)

    }


}

