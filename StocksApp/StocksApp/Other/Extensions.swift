//
//  Extensions.swift
//  StocksApp
//
//  Created by Vinojen Gengatharan on 2021-09-22.
//

import Foundation
import UIKit


//MARK: - Add Subview
extension UIView{
    func addSubviews(views : UIView...)
    {
        views.forEach { view in
            addSubview(view)
        }
    }
}




//MARK: - Framing
extension UIView {
    
    var width : CGFloat {
        frame.size.width
    }
    
    var height : CGFloat {
        frame.size.height
    }
    
    var top : CGFloat {
        frame.origin.y
    }
    
    var bottom : CGFloat {
        frame.origin.y + height
    }
    
    var right : CGFloat {
        frame.origin.x + width
    }
    
    var left : CGFloat {
        frame.origin.x
    }
}


