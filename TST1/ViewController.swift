//
//  ViewController.swift
//  TST1
//
//  Created by Sierra 4 on 01/02/17.
//  Copyright © 2017 codebrew. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate{
    let nextField = [1:2, 2:3, 3:4, 4:5, 5:6]

    
    
    @IBOutlet weak var TXTFNAME: UITextField!
    
    @IBOutlet weak var TXTPASSWORD: UITextField!

    @IBOutlet weak var TXTPHONE: UITextField!
    @IBOutlet weak var TXTCONFIRMPASSWORD: UITextField!
    @IBOutlet weak var TXTEMAIL: UITextField!
    @IBOutlet weak var TXTLNAME: UITextField!

    @IBOutlet weak var TXTABOUTME: UITextField!

    @IBOutlet weak var LBLGENDER: UILabel!

    @IBOutlet weak var LBLPHONE: UILabel!

    @IBOutlet weak var LBLTOP: UILabel!
    
    @IBOutlet weak var LBLABOUTME: UILabel!
    
    @IBOutlet weak var LBLDOB: UILabel!
     var message = ""
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        TXTPASSWORD.delegate = self
        TXTCONFIRMPASSWORD.delegate = self
        TXTFNAME.delegate = self
        TXTLNAME.delegate = self
        TXTPHONE.delegate = self
        TXTABOUTME.delegate = self
        TXTEMAIL.delegate = self
        for i in 1...6
        {
            if let textField = self.view.viewWithTag(i) as? UITextField {
            textField.delegate = self
            }
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 6
        {
        textField.resignFirstResponder()
        return true
    }
        else
        {
            if let nextTag = nextField[textField.tag]{
                if let nextResponder = textField.superview?.viewWithTag(nextTag){
                nextResponder.becomeFirstResponder()
            }
        }
        
    return false
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @IBAction func datepickerchanged(_ sender: Any) {
       let dateformatter = DateFormatter()
      dateformatter.dateStyle = DateFormatter.Style.short
//        var dateFormatter = DateFormatter()
//        
//        dateFormatter.dateStyle = NSDateFormatterStyle.Style.short
//        dateFormatter.timeStyle = NSDateFormatterStyle.Style.short
//        
//        var strDate = dateFormatter.stringFromDate(datePicker.date)
//        dateLabel.text = strDate    
    }
    
    @IBAction func REGISTER(_ sender: Any) {
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
        
//        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//            self.view.endEditing(true)
//        }
//        
//        
//        @IBAction func actionSignUpClick(_ sender: Any) {
            var flag = 1
            if((TXTFNAME.text) == "")
            {
                flag = 0
                alertBox(message: "Enter First Name")
            }
            else if !Inputvalidity(Input: TXTFNAME.text!)
                
            {
                flag = 0
                alertBox(message: "Invalid First Name")
            }
            
            if((TXTLNAME.text) == "")
            {
                flag = 0
                alertBox(message: "Enter last Name")
                
            }
            else if !Inputvalidity(Input: TXTLNAME.text!)
                
            {
                
                flag = 0
                alertBox(message: "Invalid Last Name")
                
            }
            if((TXTEMAIL.text) == "")
            {
                
                flag = 0
                alertBox(message: "Enter  Email")
            }
                
                
            else if !Emailvalidity(TXTEMAIL: TXTEMAIL.text!)
            {
                
                flag = 0
                alertBox(message: "Invalid Mail")
                
            }
            if((TXTPHONE.text) == "")
            {
                
                flag = 0
                alertBox(message: " Enter your contact No")
                
            }
            else if !Contactvalidity(value: TXTPHONE.text!)
                
            {
                
                flag = 0
                alertBox(message: "Invalid Phone No")
            }
            
            
            
            if((TXTPASSWORD.text) == "")
            {
                flag = 0
                alertBox(message: "Enter Your Password")
            }
            if((TXTCONFIRMPASSWORD.text) == "")
            {
                
                flag = 0
                alertBox(message: "Re-Enter Your Password")
                
            }
            if((TXTPASSWORD.text) != (TXTCONFIRMPASSWORD.text) )
            {
                
                flag = 0
                alertBox(message: "Password Does Not Match")
            }
            if((TXTABOUTME.text) == "")
            {
                
                flag = 0
                alertBox(message: "Write About yourself")
            }
            
            if (flag == 1)
            {
                let alert = UIAlertController(title: "Congrats !", message: "SIGNUP COMPLETED", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "ACCOMPLISHED", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
        }
        
        
        func Emailvalidity(TXTEMAIL : String) -> Bool
        {
            
            let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
            let emailT = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            let OUTPUT = emailT.evaluate(with: TXTEMAIL)
            return OUTPUT
        }
        func Contactvalidity(value: String) -> Bool {
            
            
            let PHONE_REGEX = "^[0-9]{6,12}"
            let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
            let result =  phoneTest.evaluate(with: value)
            return result
            
        }
        
        func Inputvalidity(Input:String) -> Bool {
            let RegEx = "^[a-z]+$"
            let Test = NSPredicate(format: "SELF MATCHES %@", RegEx)
            let result = Test.evaluate(with: Input)
            return result
        }
//        func isValidDate(date:String) -> Bool {
//            let RegEx = "^[0-3]?[0-9].[0-3]?[0-9].(?:[0-9]{2})?[0-9]{2}$"
//            let Test = NSPredicate(format: "SELF MATCHES %@", RegEx)
//            let result = Test.evaluate(with: date)
//            return result
//        }
        func alertBox(message : String)  {
            let alert = UIAlertController(title: "WRONG!", message: message, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OKAY", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        
    
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
    }


