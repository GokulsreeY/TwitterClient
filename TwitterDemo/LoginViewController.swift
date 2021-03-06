//
//  LoginViewController.swift
//  TwitterDemo
//
//  Created by Gokulsree Yenugadhati on 2/24/17.
//  Copyright © 2017 Gokulsree Yenugadhati. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLoginButtonClicked(_ sender: AnyObject) {
        TwitterClient.sharedInstance.login(success: { 
                print("Logged in")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }, failure: { (error) in
                print("Error: \(error.localizedDescription)")
        })
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
