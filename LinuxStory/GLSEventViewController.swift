//
//  GLSEventViewController.swift
//  LinuxStory
//
//  Created by 王鑫 on 2017/8/31.
//  Copyright © 2017年 linuxstory.gnome. All rights reserved.
//

import UIKit
import HandyJSON

/// 活动页面
class GLSEventViewController: UIViewController
{

    let sourceUrl = "https://linuxstory.org/feed/?(category/activity/)"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.testLoadFeed()
    }
    
    //读取rss信息示例
    func testLoadFeed()
    {
        DispatchQueue.global().async { [weak self] in
            let feeddata = IDNFeedParser.data(fromUrl: self?.sourceUrl)
            //            let feedinfo = IDNFeedParser.feedInfo(with: feeddata!, fromUrl: self?.sourceUrl)
            
            if let items = IDNFeedParser.feedItems(with: feeddata!, fromUrl: self?.sourceUrl) as! [IDNFeedItem]?
            {
                for item in items
                {
                    NSLog("title:%@", item.title)
                    NSLog("author:%@", item.author)
                    NSLog("identifier:%@", item.identifier)
                    NSLog("link:%@", item.link)
                    NSLog("date:%@", item.date.description)
                    
                    //updated字段为空
//                    NSLog("updated:%@", item.updated.description)
                    
                    NSLog("summary:%@", item.summary)
                    NSLog("content:%@", item.content)
                }
            }
            
        }
    }

    override func didReceiveMemoryWarning()
    {
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
