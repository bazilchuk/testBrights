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
    
    func getTitle(myURLString: String){
        var titleFromHTML = ""
        getResponseCode(myURLString: myURLString)
        
        
        guard let myURL = URL(string: myURLString) else {
            print("Error: \(myURLString) doesn't seem to be a valid URL")
            return
        }
        
        do {
            let myHTMLString = try String(contentsOf: myURL, encoding: .ascii)
            //            print("HTML : \(myHTMLString)")
            let HTMLString = String(myHTMLString)
            
            if let index = HTMLString.range(of: "</title>")?.lowerBound {
                let substring = HTMLString[..<index]
                titleFromHTML = String(substring)
                if let index = (titleFromHTML.range(of: "<title>")?.upperBound) {
                    let substring = String(titleFromHTML.suffix(from: index))
                    self.myURLtitle = String(substring)
                }
            }
        } catch let error {
            print("Error: \(error)")
        }
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
