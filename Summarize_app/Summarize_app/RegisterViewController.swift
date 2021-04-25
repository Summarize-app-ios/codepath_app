//
//  RegisterViewController.swift
//  Summarize_app
//
//  Created by Ahamed Arif on 4/24/21.
//

import UIKit
import Alamofire

let defaults = UserDefaults.standard

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var firstnameField: UITextField!
    
    @IBOutlet weak var lastnameField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextBtn(_ sender: Any) {
        
        let userName = usernameField.text!
        let password = passwordField.text!
        let email = emailField.text!
        let firstName = firstnameField.text!
        let lastName = lastnameField.text!
        
        let params: [String: String] = ["userName":userName, "password": password, "email": email, "firstName": firstName, "lastName": lastName]
        let decoder = JSONDecoder()
        
        AF.request("http://127.0.0.1:5000/user/createUser", method: .post, parameters: params, encoder: JSONParameterEncoder.default).responseJSON { response in
            if let data = response.data {
                let json = String(data: data, encoding: String.Encoding.utf8)
                defaults.set(json, forKey: "ID")
            }
            self.performSegue(withIdentifier: "prefSuccess", sender: nil)
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
