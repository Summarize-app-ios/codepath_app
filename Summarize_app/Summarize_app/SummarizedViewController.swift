//
//  SummarizedViewController.swift
//  Summarize_app
//
//  Created by Ahamed Arif on 5/5/21.
//

import UIKit

class SummarizedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func doneBtn(_ sender: Any) {
        performSegue(withIdentifier: "done", sender: nil)
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
