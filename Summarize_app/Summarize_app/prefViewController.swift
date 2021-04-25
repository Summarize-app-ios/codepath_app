//
//  prefViewController.swift
//  Summarize_app
//
//  Created by Ahamed Arif on 4/25/21.
//

import UIKit
import Alamofire


class prefViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
            
        let id = defaults.string(forKey: "ID")
        print(id)
        // Do any additional setup after loading the view.
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
