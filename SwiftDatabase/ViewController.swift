//
//  ViewController.swift
//  SwiftDatabase
//
//  Created by EDUMVA4 on 19/07/19.
//  Copyright © 2019 Kreative Developer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var username = "xyz@mail.com"
    var password = "password"
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func postMethod(){
        var request = URLRequest(url: URL(string: "http://localhost:8080/sample/senddata.php")!)
        request.httpMethod = "POST"
        let postString = "username="+self.username+"&password="+self.password
        request.httpBody = postString.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(error)")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
                
            }
            
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(responseString)")
        }
        task.resume()
    }
    @IBAction func sendData(_ sender: Any) {
        //Executing postMethod Function
        postMethod()
    }
    
}

