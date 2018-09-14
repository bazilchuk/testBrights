//
//  URLCell.swift
//  test
//
//  Created by Andrei Bazilchuk on 9/14/18.
//  Copyright © 2018 Andrei Bazilchuk. All rights reserved.
//

import UIKit

class URLCell: UITableViewCell {

    @IBOutlet weak var URLtextField: UITextField!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var statusField: UITextField!
    
    func setURL(urlClass: URLClass){
        URLtextField.text = urlClass.myURLStrings
        titleField.text = urlClass.myURLtitle
        statusField.text = String(urlClass.statusCode)
    }
}
