//
//  PKIndicatorView.swift
//
//  Created by Pramod Kumar on 07/09/18.
//  Copyright © 2018 Pramod Kumar. All rights reserved.
//

import UIKit
import UIKit


public protocol PKIndicatorAnimationDelegate {
    func setUpAnimation(in view: UIView, size: CGSize, color: UIColor)
}

public final class PKIndicatorView: UIView {
    
    //MARK:- Properties
    //MARK:- Public
    var padding: UIEdgeInsets = .zero
    
    //MARK:- View Life Cycle
    //MARK:-
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.setUpAnimation()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUpAnimation()
    }
    
    
    //MARK:- Methods
    //MARK:- Privates
    private final func setUpAnimation() {
        let animation: PKIndicatorAnimationDelegate = PKLoaderSettings.shared.indicatorType.animation
        self.backgroundColor = PKLoader.shared.backgroundColor
        let width = PKLoader.shared.indicatorRect.size.width - (PKLoaderSettings.shared.indicatorPadding.left + PKLoaderSettings.shared.indicatorPadding.right)
        let height = PKLoader.shared.indicatorRect.size.height - (PKLoaderSettings.shared.indicatorPadding.top + PKLoaderSettings.shared.indicatorPadding.bottom)
        self.layer.sublayers = nil
        animation.setUpAnimation(in: self, size: CGSize(width: max(width, PKLoaderSettings.shared.indicatorSize.width), height: max(height, PKLoaderSettings.shared.indicatorSize.height)), color: PKLoader.shared.indicatorColor)
    }
}
