//
//  UIView+Style.swift
//  NerdzStyle
//
//  Created by new user on 20.05.2020.
//

import UIKit

public protocol Stylable { }

extension UIView: Stylable { }

public extension Stylable where Self: UIView {
    static func style<V>(parent: Style<V>? = nil, _ configuration: ((Self) -> Void)? = nil) -> Style<Self> {
        return Style<Self>(parent: parent, configuration ?? { _ in })
    }

    func apply(_ styles: Style<Self>...) {
        styles.forEach({ $0.apply(to: self) })
    }
}


public extension UIView {
    
    @IBInspectable var styleIdentifier: String {
        get {
            return ""
        }
        
        set {
            if let casted = self as? Self {
                UIView.apptyStyle(with: newValue, on: casted)
            }
        }
    }
    
    static func apptyStyle<T: UIView>(with identifier: String, on element: T) {
        if let style = registeredStyles[identifier] as? Style<T> {
            element.apply(style)
        }
    }
}
