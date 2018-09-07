//
//  PKLoaderSettings.swift
//
//  Created by Pramod Kumar on 06/09/18.
//  Copyright © 2018 Pramod Kumar. All rights reserved.
//

import Foundation
import UIKit

public final class PKLoaderSettings {
    
    //MARK:- Properties
    //MARK:-
    public static let shared = PKLoaderSettings()
    private init() {}
    
    /* `backgroundSize`
     * Description: used to give the size for the main loader view.
     */
    public var backgroundSize: CGSize = CGSize(width: 100.0, height: 100.0)
    
    /* `backgroundColor`
     * Description: used to set the backgroundColor for the main loader view.
     */
    public var backgroundColor: UIColor = UIColor.white
    
    /* `cornerRadius`
     * Description: used to set the cornerRadius for the main loader view.
     */
    public var cornerRadius: CGFloat = 10.0
    
    /* `indicatorSize`
     * Description: used to set the default size of the indicator animation.
     */
    public var indicatorSize: CGSize = CGSize(width: 20.0, height: 20.0)
    
    /* `indicatorColor`
     * Description: used to set the default color of the indicator animation.
     */
    public var indicatorColor: UIColor = UIColor.gray
    
    /* `indicatorType`
     * Description: used to decide that which animation will be diaplayed.
     */
    public var indicatorType: PKLoader.IndicatorType = .ballRotateChase
    
    /* `indicatorPadding`
     * Description: used to set the padding from superView of the indicator animation.
     */
    public var indicatorPadding: UIEdgeInsets = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
    
    /* `indicatorPadding`
     * Description: used to make circle for superView of the indicator animation.
     */
    public var shouldMakeRound: Bool = true
}

