//
//  Style.swift
//  NerdzStyle
//
//  Created by new user on 20.05.2020.
//

import UIKit

public class Style<T: UIView> {
    private let configuration: (T) -> Void

    public init<V: UIView>(parent: Style<V>? = nil, _ configuration: @escaping (T) -> Void) {
        self.configuration = {
            if let parentView = $0 as? V {
                parent?.apply(to: parentView)
            }

            configuration($0)
        }
    }

    public func apply(to view: T) {
        configuration(view)
    }
}
