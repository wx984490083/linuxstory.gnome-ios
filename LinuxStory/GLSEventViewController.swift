//
//  GLSEventViewController.swift
//  LinuxStory
//
//  Created by 王鑫 on 2017/8/31.
//  Copyright © 2017年 linuxstory.gnome. All rights reserved.
//

import UIKit

/// 活动页面
class GLSEventViewController: UIViewController {

    let sourceUrl = "https://linuxstory.org/feed/?(category/activity/)"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        DispatchQueue.global().async { [weak self] in
            let feeddata = IDNFeedParser.data(fromUrl: self?.sourceUrl)
            let feedinfo = IDNFeedParser.feedInfo(with: feeddata!, fromUrl: self?.sourceUrl)
            
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
