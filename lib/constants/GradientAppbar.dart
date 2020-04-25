import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class GradientAppbar extends StatelessWidget implements PreferredSizeWidget {
  final double _preferredHeight = 70.0;

  final String title;
  final Color gradientBegin, gradientEnd;
  GradientAppbar({this.title,this.gradientBegin,this.gradientEnd}):
      assert(title!=null),
      assert(gradientBegin!=null),
      assert(gradientEnd!=null);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _preferredHeight,
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color>[
            gradientBegin,
            gradientEnd
          ]
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          letterSpacing: 5.0,
          fontSize: 30.0,
          fontWeight: FontWeight.w400
        )
      ),
    );
  }
  @override 
  Size get preferredSize => Size.fromHeight(_preferredHeight);
}
