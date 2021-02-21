//
//  UIViewController+Ext.swift
//  saltside
//
//  Created by Siddhesh Redkar on 21/02/21.
//  Copyright © 2021 Siddhesh Redkar. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController {
    
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = SSAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve // alert will have a quick fade in
            self.present(alertVC, animated: true, completion: nil)
        }
    }
   
}

public extension UIViewController {
    func setStatusBar(color: UIColor) {
        let tag = 12321
        if let taggedView = self.view.viewWithTag(tag){
            taggedView.removeFromSuperview()
        }
        let overView = UIView()
        overView.frame = UIApplication.shared.statusBarFrame
        overView.backgroundColor = color
        overView.tag = tag
        self.view.addSubview(overView)
    }
}


extension UIViewController{
    @discardableResult
      func customActivityIndicatory(_ viewContainer: UIView, startAnimate:Bool? = true) -> SpinnerView {
            let mainContainer: UIView = UIView(frame: viewContainer.frame)
            mainContainer.center = viewContainer.center
          mainContainer.backgroundColor = UIColor.init(hex: 0xFFFFFF)
            mainContainer.alpha = 0.5
            mainContainer.tag = 789456123
            mainContainer.isUserInteractionEnabled = false
        
            let viewBackgroundLoading: UIView = UIView(frame: CGRect(x:0,y: 0,width: 80,height: 80))
            viewBackgroundLoading.center = viewContainer.center
          viewBackgroundLoading.backgroundColor = UIColor.init(hex: 0x444444)
            viewBackgroundLoading.alpha = 0.5
            viewBackgroundLoading.clipsToBounds = true
            viewBackgroundLoading.layer.cornerRadius = 15
        
            let activityIndicatorView: SpinnerView = SpinnerView()
            activityIndicatorView.frame = CGRect(x:0.0,y: 0.0,width: 40.0, height: 40.0)
          //activityIndicatorView.style = .medium
            activityIndicatorView.center = CGPoint(x: viewBackgroundLoading.frame.size.width / 2, y: viewBackgroundLoading.frame.size.height / 2)
                    if startAnimate!{
                         viewBackgroundLoading.addSubview(activityIndicatorView)
                          mainContainer.addSubview(viewBackgroundLoading)
                          viewContainer.addSubview(mainContainer)
                          activityIndicatorView.animate()
                    }else{
                           for subview in viewContainer.subviews{
                                if subview.tag == 789456123{
                                  subview.removeFromSuperview()
                                }
                            }
                    }
               return activityIndicatorView
      }

}

