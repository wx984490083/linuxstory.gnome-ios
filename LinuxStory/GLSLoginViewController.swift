//
//  ViewController.swift
//  LinuxStory
//
//  Created by 王鑫 on 2017/8/31.
//  Copyright © 2017年 linuxstory.gnome. All rights reserved.
//

import UIKit

class GLSLoginViewController: UIViewController
{
    @IBOutlet var getCodeButton : UIButton?
    @IBOutlet var codeField : UITextField?
    @IBOutlet var loginButton : UIButton?
    @IBOutlet var visitorButton : UIButton?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning()
    {
        
        super.didReceiveMemoryWarning()
    }

    @IBAction func getCodeButtonTouched(sender: UIButton?)
    {
        //TODO: 执行获取活动码的操作
    }
    
    @IBAction func loginButtonTouched(sender: UIButton?)
    {
        //TODO: 登陆
//        glsAppDelegate?.switchToMainPage();
    }
    
    @IBAction func visitorButtonTouched(sender: UIButton?)
    {
        //TODO: 执行游客登陆的操作
        glsAppDelegate?.switchToMainPage();
    }
}

