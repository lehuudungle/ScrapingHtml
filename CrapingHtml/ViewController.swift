//
//  ViewController.swift
//  CrapingHtml
//
//  Created by le.huu.dung on 1/9/19.
//  Copyright © 2019 lehuudung. All rights reserved.
//

import UIKit
import Ono

class ViewController: UIViewController {
    
    let urlSendo = "https://www.sendo.vn/"
    let parameters = NSMutableDictionary.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let onoData = htmlOut.data(using: .shiftJIS)
            else {
                return
        }
        
        guard let dataStr = String.init(data: onoData, encoding: .shiftJIS) else {
            print("not convert")
            return
        }
        
        var doc = try? ONOXMLDocument.init(string: dataStr, encoding: String.Encoding.shiftJIS.rawValue)
        doc?.enumerateElements(withXPath: "//form", using: { (elm, idx, stopFlag) in
//            print("\(elm)")
            for xpath in ["//input", "//INPUT"] {
                elm.enumerateElements(withXPath: xpath, using: { (childElm, childIdx, chilStopFlag) in
                    if let name = childElm.attributes["name"] as? String {
                        print("name; \(name)")
                    }
                })
            }
            
        })
        
        
    }
        
        
}

