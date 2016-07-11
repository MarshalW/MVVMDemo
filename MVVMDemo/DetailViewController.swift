//
//  DetailViewController.swift
//  MVVCDemo
//
//  Created by Marshal Wu on 16/7/9.
//  Copyright © 2016年 Marshal Wu. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    var song:Song?
    
    func loadSong(){
        let url = NSURL (string: song!.songUrl)
        let requestObj = NSURLRequest(URL: url!);
        self.webView.loadRequest(requestObj)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.loadSong()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
