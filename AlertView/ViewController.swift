//
//  ViewController.swift
//  AlertView
//
//  Created by luckyxmobile on 16/9/30.
//  Copyright © 2016年 luckyxmobile. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let customAlertView = UIView()
    var valueAddedLabel = UILabel()
    var stepper1 = UIStepper()
    var cancelAlertViewButton = UIButton()
    var okAlertViewButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCustomView1()
    }

    @IBAction func alertViewHand(sender: AnyObject) {
        UIView.animateWithDuration(0.5) {
            self.customAlertView .alpha = 1
            self.view.backgroundColor = UIColor.grayColor()
            self.view.alpha = 0.8
        }
    }
    func setCustomView1(){
        customAlertView.frame = CGRect.init(x: 50, y: UIScreen.mainScreen().bounds.height/4, width: UIScreen.mainScreen().bounds.width-100, height: UIScreen.mainScreen().bounds.height/3+50)
        customAlertView.layer.cornerRadius = 30
        customAlertView.backgroundColor = UIColor.orangeColor()
        valueAddedLabel = UILabel.init(frame: CGRect.init(x: 20, y: 20, width: customAlertView .frame.width-40, height: 50))
        valueAddedLabel.backgroundColor = UIColor.blackColor()
        valueAddedLabel.tintColor = UIColor.whiteColor()
        valueAddedLabel.shadowColor = UIColor.whiteColor()
        valueAddedLabel.text = String(0)
        valueAddedLabel.textAlignment = .Right
        stepper1 = UIStepper.init(frame: CGRect.init(x: customAlertView .frame.width/2-50, y: 100, width:customAlertView.frame.width-40, height: 50))
        stepper1.minimumValue = -20
        stepper1.maximumValue = 20
        stepper1.addTarget(self, action: #selector(textValueChange), forControlEvents: .ValueChanged)
        cancelAlertViewButton = UIButton.init(type: .Custom)
        cancelAlertViewButton.frame = CGRect.init(x: 20, y: 160, width: (customAlertView.frame.width-40)/2, height: 50)
        cancelAlertViewButton.setTitle("Cancel", forState: .Normal)
        //cancelButton.backgroundColor = UIColor.blackColor()
        cancelAlertViewButton.backgroundColor = UIColor.init(colorLiteralRed: 0, green: 0, blue: 0, alpha: 1)
        //cancelAlertViewButton.tintColor = UIColor.blueColor()
        cancelAlertViewButton.addTarget(self, action: #selector(cancelAlertView), forControlEvents: .TouchDown)
        okAlertViewButton = UIButton.init(frame: CGRect.init(x: (customAlertView.frame.width-40)/2+30, y: 160, width: (customAlertView.frame.width-40)/2, height: 50))
        okAlertViewButton.setTitle("Ok", forState: .Normal)
        okAlertViewButton.backgroundColor = UIColor.blackColor()
        okAlertViewButton.tintColor = UIColor.whiteColor()
        okAlertViewButton.addTarget(self, action: #selector(okAlertView), forControlEvents: .TouchDown)
        customAlertView .addSubview(valueAddedLabel)
        customAlertView .addSubview(stepper1)
        customAlertView .addSubview(cancelAlertViewButton)
        customAlertView .addSubview(okAlertViewButton)
        customAlertView .alpha = 0
        self.view.addSubview(customAlertView )
    }
    func textValueChange(){
        valueAddedLabel.text = String(stepper1.value)
    }
    
    func cancelAlertView(){
        hiddenCustomView()
    }
    
    func okAlertView() {
        hiddenCustomView()
    }
    
    func hiddenCustomView(){
        UIView.transitionWithView(self.customAlertView , duration: 3.0, options: .TransitionCurlUp, animations: {
            self.customAlertView .alpha = 0
            self.view.alpha = 1
            self.view.backgroundColor = UIColor.whiteColor()
            }) { (finish) in
                
        }

    }
}

