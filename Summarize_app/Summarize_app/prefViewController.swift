//
//  prefViewController.swift
//  Summarize_app
//
//  Created by Ahamed Arif on 4/25/21.
//

import UIKit
import Alamofire
import TaggerKit
import SwiftyJSON

class prefViewController: UIViewController {
    
    @IBOutlet var addTagsTextField    : TKTextField!
    
    @IBOutlet weak var tagView: UIView!
    
    @IBOutlet weak var getTags: UIView!
    
    var prefArray = ["Tech", "Design", "Writing", "Social Media"]
    
    var settagCollection = TKCollectionView()
    var gettagCollection = TKCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gettagCollection.customBackgroundColor = UIColor.red
        
        settagCollection = TKCollectionView(tags: ["Cars", "Skateboard", "Freetime", "Humor", "Travel", "Music", "Places", "Journalism", "Sports"], action: .addTag, receiver: gettagCollection)
        
        gettagCollection = TKCollectionView(tags: ["Tech", "Design", "Writing", "Social Media"], action: .removeTag, receiver: nil)
        
        settagCollection.delegate = self
        gettagCollection.delegate = self
        
        addTagsTextField.sender = settagCollection
        addTagsTextField.receiver = gettagCollection
        
        settagCollection.action = .addTag
        settagCollection.receiver = gettagCollection
        
        add(settagCollection, toView: tagView)
        add(gettagCollection, toView: getTags)
        
        // Do any additional setup after loading the view.
    }

    //this is for nur git pull
    @IBAction func onSubmit(_ sender: Any) {
//        print(prefArray)
        let id = defaults.value(forKey: "id")
        let params: [String: Any] = ["id": id, "preferences": prefArray]
//        print(params)
        Alamofire.request("http://127.0.0.1:5000/user/updatePreferences", method: .post, parameters: params, encoding: JSONEncoding.default).responseJSON { response in
            if response.result.isSuccess {
                let userJSON : JSON = JSON(response.result.value!)
                print(userJSON)
                self.performSegue(withIdentifier: "registersubmit", sender: nil)
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

extension prefViewController: TKCollectionViewDelegate {

    func tagIsBeingAdded(name: String?) {
        // Example: save testCollection.tags to UserDefault
        prefArray.append(name!)
        print("added \(name!)")
    }
    
    func tagIsBeingRemoved(name: String?) {
        if let index = prefArray.firstIndex(of: name!) {
          prefArray.remove(at: index) // array is now ["world"]
        }
        print("removed \(name!)")
    }
}
