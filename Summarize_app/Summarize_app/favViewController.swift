//
//  favViewController.swift
//  Summarize_app
//
//  Created by Ahamed Arif on 5/21/21.
//

import UIKit

class favViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func vtn(_ sender: Any) {
        performSegue(withIdentifier: "logoutFav", sender: nil)
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
