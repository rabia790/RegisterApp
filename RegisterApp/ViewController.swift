//
//  ViewController.swift
//  RegisterApp
//
//  Created by Rabia Bembi on 2022-11-03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var SegmentedControl: UISegmentedControl!
    @IBOutlet weak var user: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    
    var registeredUsers = [[String: String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func segMented(_ sender: Any) {
        switch SegmentedControl.selectedSegmentIndex{
        case 0:
            firstName.isHidden = false
            lastName.isHidden = false
            email.isHidden = false
            registerBtn.isHidden = false
            loginBtn.isHidden = true
            
        case 1:
            firstName.isHidden = true
            lastName.isHidden = true
            email.isHidden = true
            registerBtn.isHidden = true
            loginBtn.isHidden = false
        default:
            break
        }
    }
    
    @IBAction func resgisterUser() {
        
        let infoAlert = UIAlertController(title: "verify details", message: "", preferredStyle: .alert)
        var userInfo:[String: String] = [:]
      
        
        for case let textField as UITextField in self.view.subviews{
            if textField.text == "" {
                //show error
                infoAlert.message = "you shoud fill all fields"
                self.showError(infoAlert)
                return
            }else{
                let txtKey = textField.placeholder
                let txtValue = textField.text
                userInfo[txtKey!] = txtValue!
                
            }

        }
        
        if !userInfo.isEmpty{
            //let userExists = registeredUsers["Username"] != nil
            
            //if  user.text! = self.registeredUsers["Username"]{
                
            //}
            
               
            
            
            
            for  item in     self.registeredUsers{
                for (_, _) in item{
                    if item["Username"]! == user.text!{
                        self.registeredUsers.append(userInfo)
                    }
                }
                
               
                print(self.registeredUsers)
            }
            
        }
        
       
   
        
       
        
        
    }
    
   
    
    private func showError(_ alert: UIAlertController){
        let action = UIAlertAction(title: "Retry", style: .cancel)
        alert.addAction(action)
        present(alert, animated: true)
        
        
        
    }
   

}

