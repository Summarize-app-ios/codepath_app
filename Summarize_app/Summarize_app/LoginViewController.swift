//
//  LoginViewController.swift
//  Summarize_app
//
//  Created by Ahamed Arif on 4/24/21.
//

import UIKit
import Alamofire
import SwiftyJSON

class LoginViewController: UIViewController {


    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var username: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUp(_ sender: Any) {
        self.performSegue(withIdentifier: "registerSuccess", sender: nil)
    }
    
    
    @IBAction func login(_ sender: Any) {
        let user = username.text!
        let pass = password.text!
        
        
        // Making a GET request
        Alamofire.request("http://127.0.0.1:5000/user/login/\(user)/\(pass)").responseJSON { response in
            
            if response.result.isSuccess {
                let userJSON : JSON = JSON(response.result.value!)
                defaults.set(userJSON.rawString()!, forKey: "user")
                self.performSegue(withIdentifier: "success", sender: nil)
            } else {
                print("Error: \(String(describing: response.result.error))")
            }
            
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
