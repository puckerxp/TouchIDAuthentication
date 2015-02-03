//
//  ViewController.swift
//  TouchIDAuthentication
//
//  Created by Puzhi Li on 15/2/2.
//  Copyright (c) 2015年 Puzhi Li. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController
{

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func useTouchIdButtonClicked(sender: AnyObject)
    {
        //步骤1：检查Touch ID是否可用

        let authenticationContext = LAContext()
        var error: NSError?

        let isTouchIdAvailable = authenticationContext.canEvaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics,
                error: &error)

        if isTouchIdAvailable
        {
            NSLog("恭喜，Touch ID可以使用！")
            //步骤2：获取指纹验证结果

            authenticationContext.evaluatePolicy(.DeviceOwnerAuthenticationWithBiometrics, localizedReason: "需要验证您的指纹来确认您的身份信息", reply: {
                (success, error) -> Void in
                if success
                {
                    NSLog("恭喜，您通过了Touch ID指纹验证！")
                }
                else
                {
                    NSLog("抱歉，您未能通过Touch ID指纹验证！\n\(error)")
                }
            })
        }
        else
        {
            NSLog("抱歉，Touch ID不可以使用！\n\(error)")
        }
    }
}

