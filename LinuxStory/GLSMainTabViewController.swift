//
//  GLSMainTabViewController.swift
//  LinuxStory
//
//  Created by 王鑫 on 2017/8/31.
//  Copyright © 2017年 linuxstory.gnome. All rights reserved.
//

import UIKit

class GLSMainTabViewController: UITabBarController
{

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layer.masksToBounds = true
        self.view.layer.cornerRadius = 2
        
        
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
