# DropBear

## Requirements

*Coming soon*

## Installation

_Note: For information on installing `DropBearGen` or `DropBearSupport`, view their respective `README`s._

### **Using CocoaPods**
Simply add the following line to your **UI Test** target in your Podfile:

```ruby
pod 'DropBear'
```

## Robots

*Coming soon*

## Assertion System

DropBear's assertion system can work either as an extension on current XCUI Test capabilities, or it can be paired with DropBear's **Robot** pattern, shown above.

When used along with DropBear's **Robot** pattern, assertions also become chainable, giving you clean and concise readability without losing your place as you write your tests.

To better highlight the features of the assertion system, we've broken it out in to two parts.

### **Assertions**

**Empty**

The `.empty` assertion is used to check if a `String`-based value is empty. This will also return true if a `UITextField`'s `placeholder` value matches the current value of the `UITextField`.

Example usage:

```swift
FooRobot()
    .assert(.fooTextField, .empty)
```

**Enabled**

The `.enabled` assertion is a simple wrapped around `element.isEnabled`, and can be used with any element type.

Example usage:

```swift
FooRobot()
    .assert(.fooButton, .enabled)
```

**Equal**

The `.equal` assertion compares the element's `value` to another value that the assertion accepts as a parameter. Currently, the accepted types that can be used to validate with are `Bool`, `Double`, `Int`, and `String`.

_Note: The assertion compares values as `lowercase`, making this assertion case-insensitive._

Example usage:

```swift
FooRobot()
    .assert(.fooTextField, .equal(to: "Hello, world!"))
```

**Exists**

The `.exists` assertion checks for the existence of the speicified element. By default, using this assertion will wait for the existence of the element for `5` seconds, after which time it will fail if the element does not exist.

If you would like to override the amount of time that the test waits for the element to exist, DropBear also provides a mechanism for accomplishing that.

Example usage:

```swift
FooRobot()
    .assert(.fooTextField, .exists) // Will wait for up to 5 seconds for existence
```

or

```swift
FooRobot()
    .assert(.fooTextField, .exists(waiting: 10)) // Will wait for up to 10 seconds for existence
```

**Contains**

The `.contains` assertion checks the `label` and `value` properties of the element for any matches against the parameter passed into the assertion. The only acceptable parameter type is `String`.

Assuming our example `UITextField` has a value of `Hello, world!`, the following example usage would assert `true`.

Example usage:

```swift
FooRobot()
    .assert(.fooTextField, .contains("world"))
```

### **Operators**

DropBear's assertion system also provides operators for simplifying your test writing.

**!**

The `!` operator is a method that takes an assertion as the only **unnamed** parameter. This operator inverts the result of the assertion it takes, giving you a `not`-style result.

```swift
FooRobot()
    .assert(.fooTextField, !(.exists))
```

**&&**

The `&&` operator evaluates two or more assertion results and only asserts `true` if all results are `true`.

```swift
FooRobot()
    .assert(.fooTextField, .exists && .contains("world"))
```

**||**

The `||` operator evaluates two or more assertion results and asserts `true` if any results are `true`.

```swift
FooRobot()
    .assert(.fooTextField, .exists || .contains("world"))
```
