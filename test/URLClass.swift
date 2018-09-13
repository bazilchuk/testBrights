//
//  URLClass.swift
//  test
//
//  Created by Andrei Bazilchuk on 9/13/18.
//  Copyright © 2018 Andrei Bazilchuk. All rights reserved.
//

import Foundation

class URLClass {
    
    var myURLStrings = ""
    var myURLtitle = ""
    var statusCode = Int()
    
    func getTitle(myURLString: String) -> String {
        var titleFromHTML = ""
        
        if let myURL = NSURL(string: myURLString) {
            
            var error: NSError?
            let myHTMLString = try! NSString(contentsOf: myURL as URL, encoding: String.Encoding.utf8.rawValue)
            getResponseCode(myURLString: myURLString)
            if let error = error {
                print("Error : \(error)")
            } else {
                let HTMLString = String(myHTMLString)
                
                if let index = HTMLString.range(of: "</title>")?.lowerBound {
                    let substring = HTMLString[..<index]
                    titleFromHTML = String(substring)
                    if let index = (titleFromHTML.range(of: "<title>")?.upperBound) {
                        let substring = String(titleFromHTML.suffix(from: index))
                        titleFromHTML = String(substring)
                        
                    }
                }
            }
        }
        return titleFromHTML
    }
    
    func getResponseCode(myURLString: String) {
        let url = URL(string: myURLString)
        let task = URLSession.shared.dataTask(with: url!) { _, response, _ in
            if let httpResponse = response as? HTTPURLResponse {
                self.statusCode = httpResponse.statusCode
            }
        }
        task.resume()
    }
}
