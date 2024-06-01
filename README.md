A very simple add to cart button with a counter for your apps 

## Features
- Initial Version

## Getting started

Add this to your app's `pubspec.yaml`

```yaml
dependencies:
  flutter:
    sdk: flutter
  add_to_cart_button: ^0.0.4
```

Simple usage in code

```dart
AddToCartCounterButton(
  initNumber:0,
  countItemCallback:(int){},
  incrementCallback:(){},
  decrementCallback:(){},
  minNumber: 0, 
  maxNumber: 16,
  backgroundColor Colors.black,
  buttonIconColor Colors.white,
  buttonFillColor Colors.black
);
```


