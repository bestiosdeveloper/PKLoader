//
//  PKLoader.swift
//
//  Created by Pramod Kumar on 06/09/18.
//  Copyright © 2018 Pramod Kumar. All rights reserved.
//

import Foundation
import UIKit

public final class PKLoader {
    
    //MARK:- Enum to choose the animation type
    //MARK:-
    public enum IndicatorType: Int {
        case activityIndicator
        case ballSpinFade
        case ballRotateChase
        case ballClipRotate
        case circleStrokeSpin
        
        public static let allTypes = (activityIndicator.rawValue ... circleStrokeSpin.rawValue).map { IndicatorType(rawValue: $0)! }
        
        public var animation: PKIndicatorAnimationDelegate {
            switch self {
            case .activityIndicator:
                return PKActivityIndicatorAnimation()
                
            case .ballSpinFade:
                return PKBallSpinFadeAnimation()
                
            case .ballRotateChase:
                return PKBallRotateChaseAnimation()
                
            case .ballClipRotate:
                return PKBallClipRotateAnimation()
                
            case .circleStrokeSpin:
                return PKCircleStrokeSpinAnimation()
            }
        }
    }
    
    //MARK:- Shared Object
    //MARK:-
    public static let shared = PKLoader()
    private init() {}
    
    //MARK:- Properties
    //MARK:- Private
    private var transparentView: UIView = UIView(frame: UIScreen.main.bounds)
    private var parentPreviousRect: CGRect = .zero
    private var parentPreviousCornerRadius: CGFloat = 0
    private var parentPreviousBorderWidth: CGFloat = 0
    private var parentPreviousBorderColor: CGColor = UIColor.clear.cgColor
    private var isOnWindow = false
    private var parantView: UIView?{
        didSet{
            if let parent = self.parantView {
                parentPreviousRect = parent.frame
                parentPreviousCornerRadius = parent.layer.cornerRadius
                parentPreviousBorderWidth = parent.layer.borderWidth
                parentPreviousBorderColor = parent.layer.borderColor ?? UIColor.clear.cgColor
            }
            else {
                parentPreviousRect = CGRect.zero
                parentPreviousCornerRadius = 0
                parentPreviousBorderWidth = 0
                parentPreviousBorderColor = UIColor.clear.cgColor
            }
        }
    }
    private var loaderView: UIView?
    
    //MARK:- Public
    var indicatorColor: UIColor {
        guard let parent = self.parantView else {return PKLoaderSettings.shared.indicatorColor}
        
        if let obj = parent as? UILabel {
            return obj.textColor
        }
        else if let obj = parent as? UIButton {
            return obj.titleLabel?.textColor ?? PKLoaderSettings.shared.indicatorColor
        }
        else {
            return PKLoaderSettings.shared.indicatorColor
        }
    }
    
    var backgroundColor: UIColor {
        guard let parent = self.parantView else {return PKLoaderSettings.shared.backgroundColor}
        return parent.backgroundColor ?? PKLoaderSettings.shared.backgroundColor
    }
    
    var indicatorRect: CGRect {
        guard let parent = self.parantView else {return CGRect.zero}
        var newX: CGFloat = 0.0, newY: CGFloat = 0.0, size: CGFloat = 0.0
        
        if parentPreviousRect.size.height > parentPreviousRect.size.width {
            size = parentPreviousRect.size.width
            //change y, x will remain
            newX = parentPreviousRect.origin.x
            newY = (UIScreen.main.bounds.size.height - size) / 2.0
        }
        else {
            size = parentPreviousRect.size.height
            //change x, y will remain
            newX = (UIScreen.main.bounds.size.width - size) / 2.0
            newY = parentPreviousRect.origin.y
        }
        
        if PKLoaderSettings.shared.shouldMakeRound, !self.isOnWindow {
            parent.layer.cornerRadius = size/2.0
            parent.layer.masksToBounds = true
        }
        
        return CGRect(x: newX, y: newY, width: size, height: size)
    }
    
    
    //MARK:- Methods
    //MARK:- Private
    private func setupParentView(view: UIView? = nil) {
        if let parent = view {
            self.parantView = parent
            self.isOnWindow = false
        }
        else {
            self.parantView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: PKLoaderSettings.shared.backgroundSize.width, height: PKLoaderSettings.shared.backgroundSize.height))
            if let appDelegate = UIApplication.shared.delegate, let window = appDelegate.window {
                self.isOnWindow = true
                self.parantView?.backgroundColor = PKLoaderSettings.shared.backgroundColor
                self.parantView?.layer.cornerRadius = PKLoaderSettings.shared.cornerRadius
                self.parantView?.layer.masksToBounds = true
                self.parantView?.center = window?.center ?? .zero
                
                self.transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.3)
                window?.addSubview(self.transparentView)
                window?.addSubview(self.parantView!)
            }
        }
    }
    
    private func setupLoaderView() {
        guard let parent = self.parantView else {return}
        self.loaderView = UIView(frame: parent.bounds)
        self.loaderView?.backgroundColor = self.backgroundColor
        
        let indicatorView = PKIndicatorView(frame: self.loaderView!.bounds)
        indicatorView.center = self.loaderView!.center
        self.loaderView?.addSubview(indicatorView)
        
        parent.addSubview(self.loaderView!)
    }
    
    private func startLoading() {
        guard let parent = self.parantView else {return}
        guard let loader = self.loaderView else {return}
        
        parent.translatesAutoresizingMaskIntoConstraints = false
        
        let indiFrame = self.indicatorRect
        UIView.animate(withDuration: 0.3, animations: {
            parent.frame = indiFrame
            loader.frame = parent.bounds
            if let indicator = loader.subviews.first {
                indicator.center = loader.center
            }
        }) { (completed) in
            if completed {
                
            }
        }
    }
    
    private func stopLoading() {
        guard let parent = self.parantView else {return}
        guard let loader = self.loaderView else {return}
        
        UIView.animate(withDuration: 0.3, animations: {
            parent.frame = self.parentPreviousRect
            loader.frame = parent.bounds
            if let indicator = loader.subviews.first {
                indicator.center = loader.center
            }
        }) { (completed) in
            if completed {
                
            }
        }
    }
    
    //MARK:- Public
    public func startAnimating(onView view: UIView? = nil) {
        self.stopAnimating()
        self.setupParentView(view: view)
        self.setupLoaderView()
        
        if !self.isOnWindow {
            self.startLoading()
        }
    }
    
    public func stopAnimating() {
        if !self.isOnWindow {
            self.stopLoading()
        }
        
        self.transparentView.removeFromSuperview()
        
        guard let loader = self.loaderView else {return}
        loader.removeFromSuperview()
        self.loaderView = nil
        
        guard let parent = self.parantView else {return}
        if self.isOnWindow {
            parent.removeFromSuperview()
        }
        else {
            parent.layer.cornerRadius = self.parentPreviousCornerRadius
            parent.layer.borderWidth = self.parentPreviousBorderWidth
            parent.layer.borderColor = self.parentPreviousBorderColor
        }
        self.parantView = nil
    }
}
