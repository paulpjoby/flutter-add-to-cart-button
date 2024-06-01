import 'package:flutter/material.dart';

/// A stateful button widget that allows users to add items to the cart.
///
/// This widget displays a customizable button that increments the item count
/// when tapped.
///
class AddToCartCounterButton extends StatefulWidget {
  /// The init value of the `AddToCartCounterButton`.
  ///
  /// This property determines the initial value taken by the counter.
  final int initNumber;

  /// The counterCallback of the `AddToCartCounterButton`.
  ///
  /// This method is a callback method with current value of the counter
  /// as the argument, invoked whenever there is a change in counter
  /// value due to any action.
  final Function(int) counterCallback;

  /// The increaseCallback of the `AddToCartCounterButton`.
  ///
  /// This is callback method which is invoked whenever the counter value is
  /// incremented.
  ///
  final Function increaseCallback;

  /// The decreaseCallback of the `AddToCartCounterButton`.
  ///
  /// This is callback method which is invoked whenever the counter value is
  /// decremented.
  ///
  final Function decreaseCallback;

  /// The min value of the `AddToCartCounterButton`.
  ///
  /// This property determines min value that could be taken by the counter
  final int minNumber;

  /// The max value of the `AddToCartCounterButton`.
  ///
  /// This property determines max value that could be taken by the counter
  final int maxNumber;

  /// The background color of the `AddToCartCounterButton`.
  ///
  /// This property determines background color for the entire button
  final Color backgroundColor;

  /// The icon color of the `AddToCartCounterButton`.
  ///
  /// This property determines foreground color for the icons of the counter
  /// button and the button text
  final Color buttonIconColor;

  /// The fill color of the `AddToCartCounterButton`.
  ///
  /// This property determines background color of the counter button
  final Color buttonFillColor;

  /// Constructor for `AddToCartCounterButton`.
  ///
  /// This constructor initializes the counter button with the specified
  /// background and fill colors and various other parameters.
  /// Also allows you to define max and min limit for the counter.
  const AddToCartCounterButton(
      {required this.initNumber,
      required this.counterCallback,
      required this.decreaseCallback,
      required this.increaseCallback,
      required this.minNumber,
      required this.maxNumber,
      required this.backgroundColor,
      required this.buttonIconColor,
      required this.buttonFillColor,
      super.key});

  @override
  _AddToCartCounterButtonState createState() => _AddToCartCounterButtonState();
}

class _AddToCartCounterButtonState extends State<AddToCartCounterButton> {
  int _currentCount = 0;
  Function _counterCallback = (int number) {};
  Function _increaseCallback = () {};
  Function _decreaseCallback = () {};
  int _minNumber = 0;
  int _maxNumber = 100;
  Color _backgroundColor = Colors.grey;
  Color _buttonIconColor = Colors.black;
  Color _buttonFillColor = Colors.white;

  @override
  void initState() {
    _currentCount = widget.initNumber;
    _counterCallback = widget.counterCallback;
    _increaseCallback = widget.increaseCallback;
    _decreaseCallback = widget.decreaseCallback;
    _maxNumber = widget.maxNumber;
    _minNumber = widget.minNumber;
    _backgroundColor = widget.backgroundColor;
    _buttonIconColor = widget.buttonIconColor;
    _buttonFillColor = widget.buttonFillColor;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4), color: _backgroundColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Visibility(
              visible: _currentCount > 0,
              child: _createIncrementDecrementButton(
                  Icons.remove, () => _decrease())),
          Visibility(
              visible: _currentCount > 0,
              child: const SizedBox(
                width: 6,
              )),
          Visibility(
            visible: _currentCount > 0,
            child: Text(
              _currentCount.toString(),
              style: const TextStyle(
                  color: Colors.black87, fontWeight: FontWeight.w600),
            ),
          ),
          Visibility(
              visible: _currentCount > 0,
              child: const SizedBox(
                width: 6,
              )),
          _createIncrementDecrementButton(Icons.add, () => _increment())
        ],
      ),
    );
  }

  void _increment() {
    setState(() {
      if (_currentCount < _maxNumber) {
        _currentCount++;
        _increaseCallback();
      }
      // print("$_currentCount");
      _currentCount = _currentCount;
      _counterCallback(_currentCount);
    });
  }

  void _decrease() {
    setState(() {
      if (_currentCount > _minNumber) {
        _currentCount--;
        _counterCallback(_currentCount);
        _decreaseCallback();
      }
    });
  }

  Widget _createIncrementDecrementButton(
      IconData icon, void Function() onPressed) {
    return RawMaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      constraints: const BoxConstraints(minHeight: 30.0, minWidth: 30.0),
      elevation: 0.0,
      fillColor: _buttonFillColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      onPressed: onPressed,
      child: Icon(
        icon,
        color: _buttonIconColor,
        size: 16.0,
      ),
    );
  }
}
