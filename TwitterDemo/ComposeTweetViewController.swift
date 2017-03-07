//
//  ComposeTweetViewController.swift
//  TwitterDemo
//
//  Created by Gokulsree Yenugadhati on 3/4/17.
//  Copyright © 2017 Gokulsree Yenugadhati. All rights reserved.
//

import UIKit

class ComposeTweetViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var textView: UITextView!
    var charCountLabel: UILabel!
    var defaultText: String?
    var replyStatusId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
        
        if let defaultText = defaultText {
            textView.text = defaultText
        }
        
        textView.becomeFirstResponder()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.barStyle = .default
        keyboardToolbar.sizeToFit()
        
        charCountLabel = UILabel(frame: CGRect(x: 0, y: -8, width: 30, height: 15))
        let statusCharLimit = 140
        charCountLabel.text = "\(statusCharLimit - textView.text.characters.count)"
        charCountLabel.textColor = UIColor.darkGray
        charCountLabel.textAlignment = .center
        
        let charCountView = UIView()
        charCountView.addSubview(charCountLabel)
        charCountView.sizeToFit()
        let charCountBarItem = UIBarButtonItem(customView: charCountView)
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        let tweetButton = UIBarButtonItem(title: "Tweet", style: UIBarButtonItemStyle.done, target: self, action: #selector(ComposeTweetViewController.tweetButtonClicked))

        keyboardToolbar.setItems([charCountBarItem, flexibleSpace, tweetButton], animated: true)
        textView.inputAccessoryView = keyboardToolbar
        
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let statusCharLimit = 140
        charCountLabel.text = "\(statusCharLimit - textView.text.characters.count)"
    }
    
    func tweetButtonClicked() {
        TwitterClient.sharedInstance.statusUpdate(status: textView.text, replyStatusId: replyStatusId, success: {
            print("tweeted")
            _ = self.navigationController?.popViewController(animated: true)
        }) { (error: Error) in
            print("Error: \(error.localizedDescription)")
        }
    }
    
    

}
