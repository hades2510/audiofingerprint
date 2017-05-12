//
//  ViewController.swift
//  AudioFingerPrinting
//
//  Created by Mac on 12/05/2017.
//  Copyright © 2017 ironsheep.tech. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var urlField: UITextField!
    
    private var mp3_1:Data?
    private var mp3_2:Data?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn( _ textField:UITextField ) -> Bool{
        textField.resignFirstResponder()
        return true
    }

    @IBAction func getTheMp3(_ sender: Any) {
        guard let url = urlField.text else { return }
            
        Alamofire.request( url ).responseJSON{
            response in
            
            guard let json = response.result.value as? [String:Any] else { return }
            
            guard let link = json["link"] as? String else { return }
            
            Alamofire.request( link ).responseData{
                response in
                
                self.mp3_1 = response.result.value
            }
            
        }
    }

}

