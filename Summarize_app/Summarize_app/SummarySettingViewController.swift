//
//  SummarySettingViewController.swift
//  Summarize_app
//
//  Created by Ahamed Arif on 5/5/21.
//

import UIKit

class SummarySettingViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    var pickerData = ["1 pharagraph", "2 pharagraphs", "3 pharagraphs"]
    
    @IBOutlet weak var settingScreen: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.settingScreen.delegate = self
        self.settingScreen.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
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
