import 'package:flutter/material.dart';

class CircularButoon extends StatelessWidget {
  // Making a string vairable , this string contains the button text and it is required in the constructor.
  final String title;

  // Now making a color variable
  //By default we age giving the button grey color. So no need to make it required.
  final Color defalutColor;

  // for add click listner to the container
  final VoidCallback onPress;

  const CircularButoon(
      {Key? key,
      required this.title,
      this.defalutColor = const Color(0xffa5a5a5),
      required this.onPress})
      : super(key: key);

// InkWell is the widget that makes any widgets to clickble
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onPress,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Container(
            height: 60.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: defalutColor,
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
