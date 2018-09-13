//
//  ViewController.swift
//  test
//
//  Created by Andrei Bazilchuk on 9/13/18.
//  Copyright © 2018 Andrei Bazilchuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var URLQuery = [URLClass]()
    @IBOutlet weak var textView: UITextView!
    @IBAction func getInfoButton(_ sender: UIBarButtonItem) {
        parseTextForURL()
    }
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func parseTextForURL(){
        let text = self.textView.text
        let urls = text?.components(separatedBy: .newlines)
        for item in urls! {
            let newURLClass = URLClass()
            let urlString = String(item)
            newURLClass.myURLStrings = urlString
            newURLClass.getTitle(myURLString: urlString)

            URLQuery.append(newURLClass)
            for item in URLQuery {
                            print("URL = \(item.myURLStrings)")
                            print("Title = \(item.myURLtitle)")
                            print("ResponseCode = \(item.statusCode)")
            }
        }
    }
}

