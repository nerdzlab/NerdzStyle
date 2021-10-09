//
//  Style.swift
//  NerdzStyle
//
//  Created by new user on 20.05.2020.
//

import UIKit

var registeredStyles: [String: Any] = [:]

public class Style<View: UIView> {
    private let configuration: (View) -> Void

    public init<ParentView: UIView>(parent: Style<ParentView>? = nil, _ configuration: @escaping (View) -> Void) {
        self.configuration = {
            if let parentView = $0 as? ParentView {
                parent?.apply(to: parentView)
            }

            configuration($0)
        }
    }

    public func apply(to views: View...) {
        for view in views {
            configuration(view)
        }
    }
    
    public func wrapped<WrapperView: UIView>() -> Style<WrapperView> {
        return Style<WrapperView>(parent: self) { _ in }
    }
    
    func register(with identifier: String) {
        registeredStyles[identifier] = self
    }
}
