# NerdzStyle

NerdzStyle library allow to easily create and apply CSS-like styles to view elements.

## Example

You will need to create a style to be able to use it later on. There are two options how you can do that.

### Style creation from aim class

```swift
let borderedViewStyle = UIView.style {
    $0.layer.borderWidth = 1
    $0.layer.borderColor = UIColor.white.cgColor
    $0.layer.cornerRadius = 16
}
```

### Manual style creation

```swift
let borderedViewStyle = Style<UIButton> {
    $0.layer.borderWidth = 1
    $0.layer.borderColor = UIColor.white.cgColor
    $0.layer.cornerRadius = 16
}
```
Also you can inherit from another style to create a custom hierarchy

### Style inheriting from aim class

```swift
let plainButtonStyle = UIButton.style(parent: borderedViewStyle) {
    $0.setTitleColor(.green, for: .normal)
    $0.layer.borderColor = UIColor.green.cgColor
    $0.titleLabel?.font = UIFont.preferredFont(forTextStyle: .largeTitle)
}
```

### Manual style inheritence

```swift
let plainButtonStyle = Style<UIButton>(parent: borderedViewStyle) {
    $0.setTitleColor(.green, for: .normal)
    $0.layer.borderColor = UIColor.green.cgColor
    $0.titleLabel?.font = UIFont.preferredFont(forTextStyle: .largeTitle)
}
```

To apply `Style` into some view instance you can use one of two possible ways

### Applying from view

```swift
myButton.apply(plainButtonStyle)
```

### Applying from style

```swift
plainButtonStyle.apply(to: myButton)
```

Also you can apply more than one style at once. The style priority will be increasing from left to right

### Applying several styles to view

```swift
myButton.apply(buttonStyle1, buttonStyle2, buttonStyle 3)
```

You can also apply same style to several views

### Applying style to several views

```swift
plainButtonStyle.apply(to: button1, button2, button3)
```

Because of a generics you will be forced to use the same generic parameters as view type you are applyying style to. If you want to apply style with another generic parameter - you can user `wrapped` function from `Style` class

### Using wrap function

```swift
myButton.apply(borderedViewStyle.wrapped())
```

## Installation

### Swift Package Manager
To add NerdzStyle to a [Swift Package Manager](https://swift.org/package-manager/) based project, add:

```swift
.package(url: "https://github.com/nerdzlab/NerdzStyle")
```

## License

This code is distributed under the MIT license. See the `LICENSE` file for more info.
