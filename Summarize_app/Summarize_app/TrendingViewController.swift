//
//  TrendingViewController.swift
//  Summarize_app
//
//  Created by Ahamed Arif on 4/22/21.
//

import UIKit

class TrendingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onLogout(_ sender: Any) {
        defaults.set(0, forKey: "ID")
        performSegue(withIdentifier: "logout", sender: nil)
        print(defaults.value(forKey: "ID"))
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
