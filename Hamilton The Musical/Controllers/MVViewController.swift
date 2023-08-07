//
//  MVViewController.swift
//  Hamilton The Musical
//
//  Created by 陳佩琪 on 2023/8/6.
//

import UIKit
import WebKit

class MVViewController: UIViewController {

    var link: String!
    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let url = URL(string: link)!
        webView.load(URLRequest(url:url))
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
