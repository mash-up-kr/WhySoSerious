//
//  UIImage+WhySoSerious.swift
//  WhySoSerious
//
//  Created by Naver on 2018. 1. 16..
//  Copyright © 2018년 MashUp. All rights reserved.
//

import UIKit

extension UIImage {

    class func image(with color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: 1.0, height: 0.5)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
