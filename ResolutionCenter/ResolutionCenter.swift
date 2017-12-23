//
//  ResolutionCenter.swift
//  ResolutionCenter
//
//  Created by Naver on 2017. 12. 23..
//  Copyright © 2017년 MashUp. All rights reserved.
//

import UIKit

enum DeviceType {

    case iPhone
    case iPad
}

extension UIDevice {

    var type: DeviceType {
        return UIScreen.main.iPad ? .iPad : .iPhone
    }
}

extension UIScreen {

    public var isRetina: Bool {
        return UIScreen.main.scale > 1.0
    }
}

extension UIScreen {

    public var iPhone5: Bool {
        let width = min(bounds.width, bounds.height)
        return width <= 320
    }

    public var iPhone6: Bool {
        let width = min(bounds.width, bounds.height)
        let height = max(bounds.width, bounds.height)
        return width > 320 && width <= 400 && height <= 800
    }

    public var iPhone6Plus: Bool {
        let width = min(bounds.width, bounds.height)
        return width > 400
    }

    public var iPhone10: Bool {
        let width = min(bounds.width, bounds.height)
        let height = max(bounds.width, bounds.height)
        return width > 320 && width <= 400 && height > 800
    }

    public var iPad: Bool {
        return UIDevice.current.model.hasPrefix("iPad")
    }
}

@objc
extension UILabel {

    public var fontSize_5: CGFloat {
        set { if UIScreen.main.iPhone5 { font = font.withSize(newValue) } }
        get { return font.pointSize }
    }

    public var fontSize_6: CGFloat {
        set { if UIScreen.main.iPhone6 { font = font.withSize(newValue) } }
        get { return font.pointSize }
    }

    public var fontSize_6p: CGFloat {
        set { if UIScreen.main.iPhone6Plus { font = font.withSize(newValue) } }
        get { return font.pointSize }
    }

    public var fontSize_10: CGFloat {
        set { if UIScreen.main.iPhone10 { font = font.withSize(newValue) } }
        get { return font.pointSize }
    }

    public var text_5: String {
        set { if UIScreen.main.iPhone5 { text = newValue } }
        get { return text ?? "" }
    }

    public var text_6: String {
        set { if UIScreen.main.iPhone6 { text = newValue } }
        get { return text ?? "" }
    }

    public var text_6p: String {
        set { if UIScreen.main.iPhone6Plus { text = newValue } }
        get { return text ?? "" }
    }

    public var text_10: String {
        set { if UIScreen.main.iPhone10 { text = newValue } }
        get { return text ?? "" }
    }
}

@objc
extension NSLayoutConstraint {

    public var constant_5: CGFloat {
        set { if UIScreen.main.iPhone5 { constant = newValue } }
        get { return constant }
    }

    public var constant_6: CGFloat {
        set { if UIScreen.main.iPhone6 { constant = newValue } }
        get { return constant }
    }

    public var constant_6p: CGFloat {
        set { if UIScreen.main.iPhone6Plus { constant = newValue } }
        get { return constant }
    }

    public var constant_10: CGFloat {
        set { if UIScreen.main.iPhone10 { constant = newValue } }
        get { return constant }
    }

    public var constant_ipad: CGFloat {
        set { if UIScreen.main.iPad { constant = newValue } }
        get { return constant }
    }
}

@objc
extension UICollectionViewFlowLayout {

    public var minimumLineSpacing_5: CGFloat {
        set { if UIScreen.main.iPhone5 { minimumLineSpacing = newValue } }
        get { return minimumLineSpacing }
    }

    public var minimumLineSpacing_6: CGFloat {
        set { if UIScreen.main.iPhone6 { minimumLineSpacing = newValue } }
        get { return minimumLineSpacing }
    }

    public var minimumLineSpacing_6p: CGFloat {
        set { if UIScreen.main.iPhone6Plus { minimumLineSpacing = newValue } }
        get { return minimumLineSpacing }
    }

    public var minimumLineSpacing_10: CGFloat {
        set { if UIScreen.main.iPhone10 { minimumLineSpacing = newValue } }
        get { return minimumLineSpacing }
    }

    public var minimumInteritemSpacing_5: CGFloat {
        set { if UIScreen.main.iPhone5 { minimumInteritemSpacing = newValue } }
        get { return minimumInteritemSpacing }
    }

    public var minimumInteritemSpacing_6: CGFloat {
        set { if UIScreen.main.iPhone6 { minimumInteritemSpacing = newValue } }
        get { return minimumInteritemSpacing }
    }

    public var minimumInteritemSpacing_6p: CGFloat {
        set { if UIScreen.main.iPhone6Plus { minimumInteritemSpacing = newValue } }
        get { return minimumInteritemSpacing }
    }

    public var minimumInteritemSpacing_10: CGFloat {
        set { if UIScreen.main.iPhone10 { minimumInteritemSpacing = newValue } }
        get { return minimumInteritemSpacing }
    }

    public var sectionInset_5: UIEdgeInsets {
        set { if UIScreen.main.iPhone5 { sectionInset = newValue } }
        get { return sectionInset }
    }

    public var sectionInset_6: UIEdgeInsets {
        set { if UIScreen.main.iPhone6 { sectionInset = newValue } }
        get { return sectionInset }
    }

    public var sectionInset_6p: UIEdgeInsets {
        set { if UIScreen.main.iPhone6Plus { sectionInset = newValue } }
        get { return sectionInset }
    }

    public var sectionInset_10: UIEdgeInsets {
        set { if UIScreen.main.iPhone10 { sectionInset = newValue } }
        get { return sectionInset }
    }

    public var itemSize_5: CGSize {
        set { if UIScreen.main.iPhone5 { itemSize = newValue } }
        get { return itemSize }
    }

    public var itemSize_6: CGSize {
        set { if UIScreen.main.iPhone6 { itemSize = newValue } }
        get { return itemSize }
    }

    public var itemSize_6p: CGSize {
        set { if UIScreen.main.iPhone6Plus { itemSize = newValue } }
        get { return itemSize }
    }

    public var itemSize_10: CGSize {
        set { if UIScreen.main.iPhone10 { itemSize = newValue } }
        get { return itemSize }
    }
}

@objc
extension UIScrollView {

    public var contentInset_5: UIEdgeInsets {
        set { if UIScreen.main.iPhone5 { contentInset = newValue } }
        get { return contentInset }
    }

    public var contentInset_6: UIEdgeInsets {
        set { if UIScreen.main.iPhone6 { contentInset = newValue } }
        get { return contentInset }
    }

    public var contentInset_6p: UIEdgeInsets {
        set { if UIScreen.main.iPhone6Plus { contentInset = newValue } }
        get { return contentInset }
    }

    public var contentInset_10: UIEdgeInsets {
        set { if UIScreen.main.iPhone10 { contentInset = newValue } }
        get { return contentInset }
    }
}

@objc
extension UIButton {

    public var titleEdgeInsets_5: UIEdgeInsets {
        set { if UIScreen.main.iPhone5 { titleEdgeInsets = newValue } }
        get { return titleEdgeInsets }
    }

    public var titleEdgeInsets_6: UIEdgeInsets {
        set { if UIScreen.main.iPhone6 { titleEdgeInsets = newValue } }
        get { return titleEdgeInsets }
    }

    public var titleEdgeInsets_6p: UIEdgeInsets {
        set { if UIScreen.main.iPhone6Plus { titleEdgeInsets = newValue } }
        get { return titleEdgeInsets }
    }

    public var titleEdgeInsets_10: UIEdgeInsets {
        set { if UIScreen.main.iPhone10 { titleEdgeInsets = newValue } }
        get { return titleEdgeInsets }
    }

    public var imageEdgeInsets_5: UIEdgeInsets {
        set { if UIScreen.main.iPhone5 { imageEdgeInsets = newValue } }
        get { return imageEdgeInsets }
    }

    public var imageEdgeInsets_6: UIEdgeInsets {
        set { if UIScreen.main.iPhone6 { imageEdgeInsets = newValue } }
        get { return imageEdgeInsets }
    }

    public var imageEdgeInsets_6p: UIEdgeInsets {
        set { if UIScreen.main.iPhone6Plus { imageEdgeInsets = newValue } }
        get { return imageEdgeInsets }
    }

    public var imageEdgeInsets_10: UIEdgeInsets {
        set { if UIScreen.main.iPhone10 { imageEdgeInsets = newValue } }
        get { return imageEdgeInsets }
    }

    public var contentEdgeInsets_5: UIEdgeInsets {
        set { if UIScreen.main.iPhone5 { contentEdgeInsets = newValue } }
        get { return contentEdgeInsets }
    }

    public var contentEdgeInsets_6: UIEdgeInsets {
        set { if UIScreen.main.iPhone6 { contentEdgeInsets = newValue } }
        get { return contentEdgeInsets }
    }

    public var contentEdgeInsets_6p: UIEdgeInsets {
        set { if UIScreen.main.iPhone6Plus { contentEdgeInsets = newValue } }
        get { return contentEdgeInsets }
    }

    public var contentEdgeInsets_10: UIEdgeInsets {
        set { if UIScreen.main.iPhone10 { contentEdgeInsets = newValue } }
        get { return contentEdgeInsets }
    }

    public var fontSize_5: CGFloat {
        set { if UIScreen.main.iPhone5 { titleLabel?.font = titleLabel?.font.withSize(newValue) } }
        get { return (titleLabel?.font.pointSize) ?? 0 }
    }

    public var fontSize_6: CGFloat {
        set { if UIScreen.main.iPhone6 { titleLabel?.font = titleLabel?.font.withSize(newValue) } }
        get { return (titleLabel?.font.pointSize) ?? 0 }
    }

    public var fontSize_6p: CGFloat {
        set { if UIScreen.main.iPhone6Plus { titleLabel?.font = titleLabel?.font.withSize(newValue) } }
        get { return (titleLabel?.font.pointSize) ?? 0 }
    }

    public var fontSize_10: CGFloat {
        set { if UIScreen.main.iPhone10 { titleLabel?.font = titleLabel?.font.withSize(newValue) } }
        get { return (titleLabel?.font.pointSize) ?? 0 }
    }
}
