import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostVideoButton extends StatelessWidget {
  const PostVideoButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      // Stack은 위젯을 겹쳐서 사용할 수 있음
      //clipBehavior: Clip.none은 Stack의 자식이 Stack의 영역을 벗어나도록 함
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: -3,
          bottom: -3,
          child: Container(
            height: 26,
            width: 31,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        Container(
          height: 20,
          width: 25,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(3),
          ),
          child: Center(
            child: FaIcon(
              FontAwesomeIcons.plus,
              color: Theme.of(context).primaryColor,
              size: 18,
            ),
          ),
        ),
      ],
    );
  }
}
