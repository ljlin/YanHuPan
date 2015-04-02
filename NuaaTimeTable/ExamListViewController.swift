//
//  ExamListViewController.swift
//  NuaaTimeTable
//
//  Created by ljlin on 15/2/16.
//  Copyright (c) 2015年 ljlin. All rights reserved.
//

import UIKit

class ExamListViewController: UIViewController {
    @IBOutlet weak var webView: UIWebView!
    var engine = DedEngine.sharedInstance
    var baseURL = RequestURL_DED_ExamList
    override func viewDidLoad() {
        super.viewDidLoad();
        self.webView.scrollView.showsHorizontalScrollIndicator = false
        self.webView.scalesPageToFit = true
        self.webView.loadRequest(NSURLRequest(URL: NSURL(string: self.baseURL + "?xn=&xq=&type=xh&key=161310124")!))//王克欣的学号。。。
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if let user = self.engine.userInfo {
            self.webView.loadRequest(NSURLRequest(URL: NSURL(string: self.baseURL + "?xn=&xq=&type=xh&key=\(user.xh)")!))
        }
        else if let xh = NSUserDefaults.standardUserDefaults().stringForKey("xh_preference") {
            self.webView.loadRequest(NSURLRequest(URL: NSURL(string: self.baseURL + "?xn=&xq=&type=xh&key=\(xh)")!))
        }
    }
}
