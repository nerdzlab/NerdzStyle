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
